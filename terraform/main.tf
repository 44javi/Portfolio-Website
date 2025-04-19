# main.tf
terraform {
  backend "azurerm" {} # Settings come from backend.hcl

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.25.0"
    }
  }
}

provider "azurerm" {
  subscription_id     = var.subscription_id
  storage_use_azuread = true
  features {}
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "${var.client}_portfolio_${var.suffix}"
  location = var.region
}

