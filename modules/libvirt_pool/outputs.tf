output "images" {
  value = {
    name = libvirt_pool.images.name
    path = libvirt_pool.images.target[0].path
  }
}

output "disks" {
  value = {
    name = libvirt_pool.disks.name
    path = libvirt_pool.disks.target[0].path
  }
}
