terraform {
  required_version = ">= 1.3.0"
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}