// Generate random name
resource "random_string" "name" {
  length  = 12
  special = false
  upper   = false
  lower   = true
}

// Generate random password
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#,"
  min_special      = 1
  lower            = true
  min_lower        = 1
  upper            = true
  min_upper        = 1
  min_numeric      = 1
}

// Store password to Key Vault
resource "azurerm_key_vault_secret" "sqlpassword" {
  name         = "${var.prefix}-${random_string.name.result}"
  value        = random_password.password.result
  key_vault_id = var.keyVaultId
}

