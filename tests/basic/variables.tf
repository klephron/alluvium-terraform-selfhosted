variable "images_pool" {
  type        = string
  default     = "alluvium-test-basic-images"
  description = "Pool name for images"
}

variable "disks_pool" {
  type        = string
  default     = "alluvium-test-basic-disks"
  description = "Pool name for disks"
}

variable "pools_path_prefix" {
  type        = string
  default     = "/opt/alluvium/test/basic"
  description = "Path prefix for images and disks pools"
}

variable "vms_base_source" {
  type        = string
  default     = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  description = "Base image source for defined test vms"
}
