variable "images" {
  type = object({
    name = string
    path = string
  })
}

variable "disks" {
  type = object({
    name = string
    path = string
  })
}
