terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name  = "rg-prabha"
  #   storage_account_name = "krishnastg567"
  #   container_name       = "tfstate"
  #   key                  = "prod.terraform.tfstate"
  # }

}

provider "azurerm" {
  features {}
  subscription_id = "85002d33-efb7-4e6a-8e6d-7457837654e2"
}




