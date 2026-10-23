variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "subnet_name" { type = string }
variable "subnet_id" { type = string }
variable "public_ip_id" { type = string }
variable "network_security_group_id" { type = string }
variable "public_ip_address_name" { type = string }
variable "vm_name" { type = string }
variable "vm_size" { type = string }
variable "ssh_key_public" { type = string }
variable "app_archive_url" { type = string }
variable "storage_account_name" { type = string }
variable "storage_account_key" {
  type      = string
  sensitive = true
}
