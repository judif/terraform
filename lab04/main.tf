// Resource Group
resource "azurerm_resource_group" "demo" {
  name     = var.resource_group_name
  location = "westeurope"
}

# locals {
#   databases = {
#     judifdb1 = {
#       skuName = "S0"
#       dbName = "db1"
#     }
#     judifdb2 = {
#       skuName = "S0"
#       dbName = "db2"
#     }
#     judifdb3 = {
#       skuName = "S0"
#       dbName = "db3"
#     }
#   }
# }

# module "sql" {
#   source            = "./modules/azuresql"
#   for_each          = yamldecode(file("databases.yaml"))["databases"]
#   prefix            = each.key
#   resourceGroupName = azurerm_resource_group.demo.name
#   location          = azurerm_resource_group.demo.location
#   keyVaultId        = azurerm_key_vault.kv.id
#   subnetId          = azurerm_subnet.db.id
#   dnsZoneId         = azapi_resource.privatednssql.id
#   dbName            = each.value["dbName"]
#   skuName           = each.value["skuName"]
#   enableAudit       = true 
# }

# locals {
#   vms = {
#     judifvm1 = {
#       skuName = "Standard_F2"
#     }
#     judifvm2 = {
#       skuName = "Standard_F2"
#     }
#   }
# }

module "vm" {
  source            = "./modules/azurewindowsvm"
  for_each          = yamldecode(file("../../vms.yaml"))["vms"]
  # for_each          = local.vms
  resourceGroupName = azurerm_resource_group.demo.name
  location          = azurerm_resource_group.demo.location
  size              = each.value["size"]
  # size              = each.value.skuName
  subnet_id         = azurerm_subnet.vm.id
  prefix            = each.key 
  keyVaultId        = azurerm_key_vault.kv.id
}