output "images" {
  value = {
    for k, p in libvirt_pool.images :
    k => {
      name = p.name
      path = p.target[0].path
    }
  }
}

output "disks" {
  value = {
    for k, p in libvirt_pool.disks :
    k => {
      name = p.name
      path = p.target[0].path
    }
  }
}
