resource "libvirt_pool" "images" {
  name = var.images.name
  type = "dir"
  target {
    path = var.images.path
  }
}

resource "libvirt_pool" "disks" {
  name = var.disks.name
  type = "dir"
  target {
    path = var.disks.path
  }
}
