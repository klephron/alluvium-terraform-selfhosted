variable "images" {
  type = object({
    name = string
  })
}

variable "disks" {
  type = object({
    name = string
  })
}

variable "base" {
  type = object({
    source = string
  })
}

variable "settings" {
  type = map(object({
    vcpu      = number
    memory    = number      # in MB
    disk_size = number      # in GB
    hostfwd = list(object({ # ports to forward
      from = number
      to   = number
    }))
  }))
}
