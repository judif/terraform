// Resource Group
resource "azurerm_resource_group" "demo" {
  name     = "rg-lab02"
  location = "westeurope"
}

module "sql" {
  source            = "./modules/azuresql"
  name              = module.secrets.name
  password          = module.secrets.secret_sqlpassword 
  resourceGroupName = azurerm_resource_group.demo.name
  location          = azurerm_resource_group.demo.location
  keyVaultId        = azurerm_key_vault.kv.id
  subnetId          = azurerm_subnet.db.id
  dnsZoneId         = azapi_resource.privatednssql.id
  dbName            = "testdb"
}

module "secrets" {
  source            = "./modules/secrets"
  prefix            = "judif"
  keyVaultId        = azurerm_key_vault.kv.id
}
