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

resource "azurerm_monitor_autoscale_setting" "autoscale_asp" {
  count = var.app_instance_count

  name                = "${var.name}-autoscale"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  target_resource_id  = azurerm_service_plan.asp[count.index].id

  profile {
    name = "Scale with Memory Utilisation"

    capacity {
      default = 1
      minimum = 1
      maximum = 1
    }

    rule {
      metric_trigger {
        metric_name        = "MemoryPercentage"
        metric_resource_id = azurerm_service_plan.asp[count.index].id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 70
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "MemoryPercentage"
        metric_resource_id = azurerm_service_plan.asp[count.index].id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT10M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 50
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
  }

  notification {
    email {
      custom_emails = var.scaling_notification_email
    }
  }
}