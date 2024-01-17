// Generate random name
resource "random_string" "name" {
  length  = 5
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

resource "azurerm_network_interface" "example" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = var.resourceGroupName

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = "${var.prefix}-${random_string.name.result}"
  resource_group_name = var.resourceGroupName
  location            = var.location
  size                = var.size
  admin_username      = "adminuser"
  admin_password      = random_password.password.result
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  tags = {
    source = "terraform"
  }

  lifecycle {
    ignore_changes = [
        patch_mode,
        enable_automatic_updates
    ]
  }
}