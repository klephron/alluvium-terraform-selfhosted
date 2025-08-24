locals {
  alluvium_net_1 = "alluvium-net-1"
}

module "selfhosted" {
  source = "../.."

  pools = {
    images = {
      "${var.images_pool}" = {
        path = "${var.pools_path_prefix}/images"
      },
    }
    disks = {
      "${var.disks_pool}" = {
        path = "${var.pools_path_prefix}/disks"
      }
    }
  }

  networks = {
    "${local.alluvium_net_1}" = {
      bridge = "br-alluvium-1"
    }
  }

  vms = {
    alluvium-test-basic-1 = {
      pools = {
        images = var.images_pool
        disks  = var.disks_pool
      }
      base = {
        source = var.vms_base_source
      }
      vcpu      = 2
      memory    = 2048
      disk_size = 30
    }
    alluvium-test-basic-2 = {
      pools = {
        images = var.images_pool
        disks  = var.disks_pool
      }
      base = {
        source = var.vms_base_source
      }
      vcpu      = 2
      memory    = 2048
      disk_size = 30
      bridges = [
        local.alluvium_net_1
      ]
    }
    alluvium-test-basic-3 = {
      pools = {
        images = var.images_pool
        disks  = var.disks_pool
      }
      base = {
        source = var.vms_base_source
      }
      vcpu      = 2
      memory    = 2048
      disk_size = 30
      hostfwd = [
        {
          from = 19998
          to   = 19998
        },
        {
          from = 19999
          to   = 19999
        }
      ]
      bridges = [
        local.alluvium_net_1
      ]
    }
  }
}
