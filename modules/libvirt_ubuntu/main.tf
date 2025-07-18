resource "libvirt_volume" "base" {
  name   = basename(var.base.source)
  source = var.base.source
  pool   = var.images.name
}

# Cloud-init config
data "template_file" "user_data" {
  template = file("${path.module}/cloudinit/cloud_init.cfg")
}

data "template_file" "network_config" {
  template = file("${path.module}/cloudinit/network_config.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = var.images.name
}

# VM resources
resource "libvirt_volume" "vm" {
  for_each       = var.settings
  name           = "${each.key}.qcow2"
  pool           = var.disks.name
  base_volume_id = libvirt_volume.base.id
  size           = each.value.disk_size * 1024 * 1024 * 1024
}

resource "libvirt_domain" "vm" {
  for_each = var.settings
  name     = each.key
  vcpu     = each.value.vcpu
  memory   = each.value.memory

  cpu {
    mode = "host-passthrough"
  }

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  disk {
    volume_id = libvirt_volume.vm[each.key].id
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
      xslt = templatefile("${path.module}/hostfwd.xsl.tftpl", {
        hostfwd = each.value.hostfwd
      })
    }
  }
}
