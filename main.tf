terraform {
  required_version = ">= 1.3.0"
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

data "terraform_remote_state" "foo" {
  backend = "azurerm"
  config = {
    storage_account_name = "devopstestsatf"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
    subscription_id      = "a4ccfc3f-2800-474b-b2de-bdd021a510c1"
    tenant_id            = "18469708-093e-42c9-9dbf-7f57ac8f8d0e"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.name}-rg"
  location = var.location
}