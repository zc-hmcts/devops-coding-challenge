resource "azurerm_mssql_server" "sql_server" {
  name                          = "${var.name}-zc"
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

  name           = "${var.name}-db"
  server_id      = azurerm_mssql_server.sql_server.id
  collation      = var.collation
  max_size_gb    = 4
  read_scale     = true
  sku_name       = var.sql_sku
  zone_redundant = true

  tags = var.tags
}