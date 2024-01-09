locals {
  vnetName = "vnet-tf-demo"
  vnetResoucreGroupName = "rg-lab03"
}

data "azurerm_virtual_network" "example" {
  name                = local.vnetName
  resource_group_name = local.vnetResoucreGroupName
}

data "azurerm_key_vault_secret" "example" {
  name         = ""
  key_vault_id = ""
}

output "secret_value" {
  value     = data.azurerm_key_vault_secret.example.value
  sensitive = true
}

output "ipRangeFromData" {
  value = data.azurerm_virtual_network.example.address_space
}