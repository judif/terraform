// SQL server
resource "azurerm_mssql_server" "module" {
  name                         = var.name
  resource_group_name          = var.resourceGroupName
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "azureuser"
  administrator_login_password = var.password
}

// Create Private Endpoint and DNS zone group
resource "azurerm_private_endpoint" "azuresql" {
  name                = "${azurerm_mssql_server.module.name}-pe"
  resource_group_name = var.resourceGroupName
  location            = var.location
  subnet_id           = var.subnetId

  private_dns_zone_group {
    name                 = "${azurerm_mssql_server.module.name}-zonegroup"
    private_dns_zone_ids = [var.dnsZoneId]
  }

  private_service_connection {
    name                           = "${azurerm_mssql_server.module.name}-pconnection"
    private_connection_resource_id = azurerm_mssql_server.module.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
}

// SQL Database
resource "azurerm_mssql_database" "module" {
  name           = var.dbName
  server_id      = azurerm_mssql_server.module.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  read_scale     = var.readScale
  sku_name       = var.skuName
  zone_redundant = var.zoneRedundant
}