resource "azurerm_storage_account" "sa" {
  name                     = "${var.name}-sa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "asp" {
  name                = "${var.name}-asp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "example" {
  name                = "${var.name}-function-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  # storage_account_name       = azurerm_storage_account.example.name
  # storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id = azurerm_service_plan.asp.id

  site_config {}
}