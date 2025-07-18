module "pool" {
  source = "./modules/libvirt_pool"

  images = {
    for k, v in var.selfhosted.pools.images :
    k => {
      name = k
      path = v.path
    }
  }
  disks = {
    for k, v in var.selfhosted.pools.disks :
    k => {
      name = k
      path = v.path
    }
  }
}

module "ubuntu" {
  source = "./modules/libvirt_ubuntu"

  vms = {
    for k, v in var.selfhosted.vms.ubuntu :
    k => {
      pools = {
        images = module.pool.images[v.pools.images].name
        disks  = module.pool.disks[v.pools.disks].name
      }
      base = {
        source = v.base.source
      }
      vcpu      = v.vcpu
      memory    = v.memory
      disk_size = v.disk_size
      hostfwd   = v.hostfwd
    }
  }
}
