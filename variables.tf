variable "pools" {
  type = object({
    images = map(object({
      path = string
    }))
    disks = map(object({
      path = string
    }))
  })
}

variable "vms" {
  type = map(object({
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
}
