output "azurerm_storage_account_id" {
  value = azurerm_storage_account.main.id
}

output "azurerm_storage_container_id" {
  value = azurerm_storage_container.main.id
}

output "storage_account_name" {
  value = azurerm_storage_account.main.name
}

output "storage_account_primary_access_key" {
  value     = azurerm_storage_account.main.primary_access_key
  sensitive = true
}
