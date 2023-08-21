#Deploy Network Security Group vmansible
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-udemy-terraform"
  resource_group_name = azurerm_resource_group.rg-udemy.name
  location            = azurerm_resource_group.rg-udemy.location

  security_rule {

    name                       = "ssh_port"
    priority                   = 301
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "177.64.205.70"
    destination_address_prefix = "*"
  }

  tags = local.common_tags

}

#Associate subnet
resource "azurerm_subnet_network_security_group_association" "subnet-nsg" {
  subnet_id                 = azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.nsg.id

}


