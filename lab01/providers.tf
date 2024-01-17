terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~>3.81.0"
        }   
    }
    backend "azurerm" {
        resource_group_name  = "tfstate"
        storage_account_name = "tfstate269"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false

    }
    template_deployment {
      delete_nested_items_during_deletion = false
    }
  }
}