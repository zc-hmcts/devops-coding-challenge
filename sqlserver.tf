resource "azurerm_mssql_server" "sql_server" {
  name                          = var.name
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = var.location
  minimum_tls_version           = "1.2"
  version                       = "12.0"
  public_network_access_enabled = false

  azuread_administrator {
    azuread_authentication_only = true
    login_username              = "Zoe Cope"
    object_id                   = "6758a03c-1f22-4e53-9fc8-2c90641c2cb8"
  }

  tags = {
    environment = "production"
  }
}

resource "azurerm_mssql_database" "sql_db" {
  name           = "${var.name}-db"
  server_id      = azurerm_mssql_server.sql_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true

  tags = {
    foo = "bar"
  }
}