# devops-coding-challenge

A repo which will deploy an Azure function and an SQL server
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.29.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_insights.ai](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_linux_function_app.lfa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app) | resource |
| [azurerm_monitor_autoscale_setting.autoscale_asp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_mssql_database.sql_db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |
| [azurerm_mssql_server.sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_service_plan.asp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_storage_account.sa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_instance_count"></a> [app\_instance\_count](#input\_app\_instance\_count) | n/a | `number` | `2` | no |
| <a name="input_asp_sku"></a> [asp\_sku](#input\_asp\_sku) | n/a | `string` | `"P1v2"` | no |
| <a name="input_db_instance_count"></a> [db\_instance\_count](#input\_db\_instance\_count) | n/a | `number` | `2` | no |
| <a name="input_dotnet_version"></a> [dotnet\_version](#input\_dotnet\_version) | n/a | `string` | `"6.0"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"UK South"` | no |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | n/a | `string` | `"1.2"` | no |
| <a name="input_mssql_server_version"></a> [mssql\_server\_version](#input\_mssql\_server\_version) | n/a | `string` | `"12.0"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"devops-test"` | no |
| <a name="input_scaling_notification_email"></a> [scaling\_notification\_email](#input\_scaling\_notification\_email) | n/a | `list` | `[]` | no |
| <a name="input_storage_account_account_replication_type"></a> [storage\_account\_account\_replication\_type](#input\_storage\_account\_account\_replication\_type) | n/a | `string` | `"LRS"` | no |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | n/a | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
