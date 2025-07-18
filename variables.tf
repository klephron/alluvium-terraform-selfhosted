variable "selfhosted" {
  type = object({
    pools = object({
      images = object({
        name = string
        path = string
      })
      disks = object({
        name = string
        path = string
      })
    })
    vms = object({
      ubuntu = map(object({
        pools = object({
          images = string
          disks  = string
        })
        base = object({
          source = string
        })
        settings = map(object({
          memory    = number
          vcpu      = number
          disk_size = number
          hostfwd = list(object({
            from = number
            to   = number
          }))
        }))
      }))
    })
  })
  default = {
    pools = {
      images = {}
      disks  = {}
    }
    vms = {
    }
  }
}
