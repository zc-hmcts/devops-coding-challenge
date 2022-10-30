resource "azurerm_mssql_server" "sqlserver" {
  name                          = var.name
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = var.location
  minimum_tls_version           = "1.2"
  version                       = "5.7"
  public_network_access_enabled = false

  sku_name                          = "GP_Gen5_2"
  storage_mb                        = 5120
  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"

  azuread_administrator {
    azuread_authentication_only = true
    login_username              = "Zoe Cope"
    object_id                   = "6758a03c-1f22-4e53-9fc8-2c90641c2cb8"
  }

  tags = {
    environment = "production"
  }
}

resource "azurerm_mysql_database" "example" {
  name                = "exampledb"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_mysql_server.example.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}