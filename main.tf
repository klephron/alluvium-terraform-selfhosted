resource "libvirt_pool" "images" {
  for_each = var.pools.images

  name = each.key
  type = "dir"
  target {
    path = each.value.path
  }
}

resource "libvirt_pool" "disks" {
  for_each = var.pools.disks

  name = each.key
  type = "dir"
  target {
    path = each.value.path
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/files/cloud_init.cfg")
}

data "template_file" "network_config" {
  template = file("${path.module}/files/cloud_init_network.cfg")
}


resource "libvirt_volume" "image_base" {
  for_each = var.vms

  name   = "base-${each.key}.img"
  source = each.value.base.source
  pool   = libvirt_pool.images[each.value.pools.images].name
}


resource "libvirt_cloudinit_disk" "image_cloudinit" {
  for_each = var.vms

  name           = "commoninit_${each.key}.img"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = libvirt_pool.images[each.value.pools.images].name
}


resource "libvirt_volume" "disk" {
  for_each = var.vms

  name           = "${each.key}.qcow2"
  pool           = libvirt_pool.disks[each.value.pools.disks].name
  base_volume_id = libvirt_volume.image_base[each.key].id
  size           = each.value.disk_size * 1024 * 1024 * 1024
}

resource "libvirt_domain" "vm" {
  for_each = var.vms

  name   = each.key
  vcpu   = each.value.vcpu
  memory = each.value.memory

  cpu {
    mode = "host-passthrough"
  }

  cloudinit = libvirt_cloudinit_disk.image_cloudinit[each.key].id

  disk {
    volume_id = libvirt_volume.disk[each.key].id
  }

  network_interface {
    network_name   = "default"
    wait_for_lease = true
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
  }

  dynamic "xml" {
    for_each = length(each.value.hostfwd) > 0 ? [1] : []
    content {
      xslt = templatefile("${path.module}/files/hostfwd.xsl.tftpl", {
        hostfwd = each.value.hostfwd
      })
    }
  }
}
