module "pool" {
  source = "./modules/libvirt_pool"

  images = {
    for_each = var.selfhosted.pools.images
    name     = each.name
    path     = each.path
  }
  disks = {
    for_each = var.selfhosted.pools.disks
    name     = each.name
    path     = each.path
  }
}

module "ubuntu" {
  source = "./modules/libvirt_ubuntu"

  vms = var.selfhosted.vms.ubuntu
}
