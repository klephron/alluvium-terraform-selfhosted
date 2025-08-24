variable "pools" {
  type = object({
    images = map(object({
      path = string
    }))
    disks = map(object({
      path = string
    }))
  })
  default = {
    images = {}
    disks  = {}
  }
}

variable "bridges" {
  type = map(object({
    bridge = string
  }))
  default = {}
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
    hostfwd = optional(list(object({
      from = number
      to   = number
    })), [])
    bridges = optional(list(string), [])
  }))
  default = {}
}
