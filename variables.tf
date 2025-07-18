variable "vms" {
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
      ubuntu = object({
        base = string
        settings = map(object({
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
  })
}
