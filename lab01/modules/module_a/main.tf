resource "azurerm_resource_group" "module_a_rg" {
    name     = var.resource_group_name
    location = "germanywestcentral"
}