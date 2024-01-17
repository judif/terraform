resource "azurerm_resource_group" "state-demo-secure" {
    name     = "tfstate-demo"
    location = "germanywestcentral"
}

# module "module_a" {
#     source = "./modules/module_a"

#     resource_group_name = "rg-module-a"
# }

# module "module_b" {
#     source = "./modules/module_a"

#     resource_group_name = module.module_a.name
# }