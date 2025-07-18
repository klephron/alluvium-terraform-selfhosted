variable "selfhosted" {
  type = object({
    pools = object({
      images = map(object({
        path = string
      }))
      disks = map(object({
        path = string
      }))
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
        memory    = number
        vcpu      = number
        disk_size = number
        hostfwd = list(object({
          from = number
          to   = number
        }))
      }))
    })
  })
}
