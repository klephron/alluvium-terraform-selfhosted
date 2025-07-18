variable "vms" {
  type = map(object({
    pools = {
      images = string
      disks  = string
    }
    base = {
      source = string
    }
    vcpu      = number
    memory    = number      # in MB
    disk_size = number      # in GB
    hostfwd = list(object({ # ports to forward
      from = number
      to   = number
    }))
  }))
}
