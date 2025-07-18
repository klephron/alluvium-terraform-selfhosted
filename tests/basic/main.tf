module "vm" {
  source = "../.."

  selfhosted = {
    pools = {
      images = {
        alluvium-test-images = {
          path = "/opt/alluvium/test/images"
        },
      }
      disks = {
        alluvium-test-disks = {
          path = "/opt/alluvium/test/disks"
        }
      }
    }
    vms = {
      ubuntu = {
        1 = {
          pools = {
            images = "alluvium-test-images"
            disks  = "alluvium-test-disks"
          }
          base = {
            source = "/home/nikit/vms/images/focal-server-cloudimg-amd64-disk-kvm.img"
          }
          vcpu      = 2
          memory    = 2048
          disk_size = 30
          hostfwd   = []
        }
        2 = {
          pools = {
            images = "alluvium-test-images"
            disks  = "alluvium-test-disks"
          }
          base = {
            source = "/home/nikit/vms/images/focal-server-cloudimg-amd64-disk-kvm.img"
          }
          vcpu      = 2
          memory    = 2048
          disk_size = 30
          hostfwd   = []
        }
      }
    }
  }
}
