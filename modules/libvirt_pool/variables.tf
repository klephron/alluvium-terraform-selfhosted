variable "images" {
  type = map(object({
    name = string
    path = string
  }))
}

variable "disks" {
  type = map(object({
    name = string
    path = string
  }))
}
