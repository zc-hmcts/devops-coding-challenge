resource "azurerm_mssql_server" "sql_server" {
  count = var.db_instance_count

  name                          = "${var.name}-zc-${count.index}"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = var.location
  minimum_tls_version           = var.minimum_tls_version
  version                       = var.mssql_server_version
  public_network_access_enabled = false

  azuread_administrator {
    azuread_authentication_only = true
    login_username              = "Zoe Cope"
    object_id                   = "6758a03c-1f22-4e53-9fc8-2c90641c2cb8"
  }

  tags = var.tags
}

resource "azurerm_mssql_database" "sql_db" {
  count = var.db_instance_count

  name         = "${var.name}-db-${count.index}"
  server_id    = azurerm_mssql_server.sql_server[count.index].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 5
  sku_name     = "S0"

  tags = var.tags
}