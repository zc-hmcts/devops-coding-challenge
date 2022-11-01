resource "azurerm_storage_account" "sa" {
  name                     = "devopstestsazc"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_account_replication_type
}

resource "azurerm_service_plan" "asp" {
  count = var.app_instance_count

  name                = "${var.name}-asp-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.asp_sku
}

resource "azurerm_linux_function_app" "lfa" {
  count = var.app_instance_count

  name                = "${var.name}-function-app-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  storage_account_name = azurerm_storage_account.sa.name
  service_plan_id      = azurerm_service_plan.asp[count.index].id

  site_config {
    application_stack {
      dotnet_version = var.dotnet_version
    }
  }
}

resource "azurerm_application_insights" "ai" {
  name                = "${var.name}-app-insights"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}