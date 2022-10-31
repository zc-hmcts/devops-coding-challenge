resource "azurerm_storage_account" "sa" {
  name                     = "devopstestsazc"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_account_replication_type
}

resource "azurerm_service_plan" "asp" {
  name                = "${var.name}-asp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.asp_sku
}

resource "azurerm_linux_function_app" "lfa" {
  count = var.app_instance_count

  name                = "${var.name}-function-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  storage_account_name = azurerm_storage_account.sa.name
  service_plan_id      = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      dotnet_version = var.dotnet_version
    }
  }
}