resource "libvirt_pool" "images" {
  for_each = var.images

  name = each.value.name
  type = "dir"
  target {
    path = each.value.path
  }
}

resource "libvirt_pool" "disks" {
  for_each = var.disks

  name = each.value.name
  type = "dir"
  target {
    path = each.value.path
  }
}
