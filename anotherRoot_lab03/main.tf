locals {
  vnetName = "vnet-tf-demo"
  vnetResoucreGroupName = "rg-lab03"
}

data "azurerm_virtual_network" "example" {
  name                = local.vnetName
  resource_group_name = local.vnetResoucreGroupName
}

output "ipRangeFromData" {
  value = data.azurerm_virtual_network.example.address_space
}

data "azurerm_key_vault_secret" "example" {
  name         = "judifvm1-ywbf8"
  key_vault_id = "/subscriptions/e97932fb-27a0-4b77-9e88-816d9a93bc60/resourceGroups/rg-lab03/providers/Microsoft.KeyVault/vaults/uxo5cdkcsuatrcie"
}

output "secret_value" {
  value     = data.azurerm_key_vault_secret.example.value
  sensitive = true
}
