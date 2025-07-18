output "vms" {
  description = "ALL VM details"
  value = {
    for name, settings in var.settings : name => {
      name = libvirt_domain.vm[name].name,
      ip   = libvirt_domain.vm[name].network_interface[0].addresses[0]
    }
  }
}
