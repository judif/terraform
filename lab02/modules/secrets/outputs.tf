output "secret_sqlpassword" {
  value     = azurerm_key_vault_secret.sqlpassword.value
  sensitive = true
}

output "name" {
  value = "${var.prefix}-${random_string.name.result}"
}