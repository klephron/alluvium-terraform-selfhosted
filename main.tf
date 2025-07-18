module "pool" {
  source = "./modules/libvirt_pool"

  images = {
    name = var.vms.pools.images.name
    path = var.vms.pools.images.path
  }
  disks = {
    name = var.vms.pools.disks.name
    path = var.vms.pools.disks.path
  }
}

module "ubuntu" {
  source = "./modules/libvirt_ubuntu"

  images = {
    name = module.pool.images.name
  }
  disks = {
    name = module.pool.disks.name
  }
  base = {
    source = var.vms.vms.ubuntu.base
  }
  settings = var.vms.vms.ubuntu.settings
}
