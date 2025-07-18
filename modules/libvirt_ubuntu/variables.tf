variable "vms" {
  type = map(object({
    pools = object({
      images = string
      disks  = string
    })
    base = object({
      source = string
    })
    vcpu      = number
    memory    = number      # in MB
    disk_size = number      # in GB
    hostfwd = list(object({ # ports to forward
      from = number
      to   = number
    }))
  }))
}
