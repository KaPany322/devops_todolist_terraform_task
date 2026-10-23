variable "location" {
  default = "westus2"
}

variable "resource_group_name" {
  default = "mate-azure-task-12"
}

variable "virtual_network_name" {
  default = "vnet"
}

variable "vnet_address_prefix" {
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  default = "default"
}

variable "subnet_address_prefix" {
  default = "10.0.0.0/24"
}

variable "network_security_group_name" {
  default = "defaultnsg"
}

variable "public_ip_address_name" {
  default = "linuxboxpip"
}

variable "vm_name" {
  default = "matebox"
}

variable "vm_size" {
  default = "Standard_D2s_v5"
}

variable "ssh_key_public" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII128b9QGduAGb9xiXoP1Fw0KzuD01bBLwg5x/FBiqQv makarenko11223@gmail.com"
}

variable "dns_label" {
  default = "matetask"
}