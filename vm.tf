resource "azurerm_public_ip" "ip-vm" {
  name                = "public-ip-terraform-udemy"
  resource_group_name = azurerm_resource_group.rg-udemy.name
  location            = azurerm_resource_group.rg-udemy.location
  tags                = local.common_tags
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  name                = "nic-terraform-udemy"
  resource_group_name = azurerm_resource_group.rg-udemy.name
  location            = azurerm_resource_group.rg-udemy.location
  ip_configuration {
    name                          = "public-ip-terraform-udemy"
    subnet_id                     = azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ip-vm.id
  }
  tags = local.common_tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "vm-udemy-terraform"
  resource_group_name   = azurerm_resource_group.rg-udemy.name
  location              = azurerm_resource_group.rg-udemy.location
  size                  = "Standard_B1s"
  admin_username        = "terraform"
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username   = "terraform"
    public_key = var.azure_pub_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  tags = local.common_tags
}