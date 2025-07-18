module "selfhosted" {
  source = "../.."

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
      test-basic-1 = {
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
      test-basic-2 = {
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
      test-basic-3 = {
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
      }
    }
  }
}
