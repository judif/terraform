locals {
  env = "staging"
}

module "dev" {
    source              = "../../."
    resource_group_name = "rg-lab-04-${local.env}"
}