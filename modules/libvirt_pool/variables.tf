variable "images" {
  type = map(object({
    path = string
  }))
}

variable "disks" {
  type = map(object({
    path = string
  }))
}
