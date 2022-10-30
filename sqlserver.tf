resource "azurerm_mssql_server" "this" {
  name                = var.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  version             = "12.0"
  minimum_tls_version = "1.2"

  azuread_administrator {
    login_username = "Zoe Cope"
    object_id      = "6758a03c-1f22-4e53-9fc8-2c90641c2cb8"
  }

  tags = {
    environment = "production"
  }
}