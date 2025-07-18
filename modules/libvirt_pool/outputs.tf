output "images" {
  value = {
    for k, v in libvirt_pool.images :
    k => {
      name = k
      path = v.target[0].path
    }
  }
}

output "disks" {
  value = {
    for k, v in libvirt_pool.disks :
    k => {
      name = k
      path = v.target[0].path
    }
  }
}
