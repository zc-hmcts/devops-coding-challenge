variable "name" {
  default = "devops-test"
}

variable "location" {
  default = "UK South"
}

variable "app_instance_count" {
  default = 2
}

variable "db_instance_count" {
  default = 2
}

variable "storage_account_tier" {
  default = "Standard"
}

variable "storage_account_account_replication_type" {
  default = "LRS"
}

variable "asp_sku" {
  default = "P1v2"
}

variable "dotnet_version" {
  default = "6.0"
}

variable "minimum_tls_version" {
  default = "1.2"
}

variable "mssql_server_version" {
  default = "12.0"
}

variable "tags" {
  default = {}
}

variable "zone_redundant" {
  default = false
}