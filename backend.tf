data "archive_file" "app" {
  type        = "zip"
  source_dir  = path.module
  output_path = "${path.module}/app.zip"

  excludes = [
    ".git/**",
    ".terraform/**",
    ".terraform.tfstate.lock.info",
    "app.zip",
    "terraform-code.zip",
    "tfplan",
    "terraform.tfstate",
    "terraform.tfstate.*",
    "terraform.tfstate.d/**",
  ]
}


resource "azurerm_storage_blob" "archive" {
  name                 = "storageblob"
  storage_container_id = module.storage.azurerm_storage_container_id
  type                 = "Block"
  source               = data.archive_file.app.output_path
}
