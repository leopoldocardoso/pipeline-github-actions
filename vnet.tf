# Deploy VNET
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-udemy-terraform"
  resource_group_name = azurerm_resource_group.rg-udemy.name
  location            = azurerm_resource_group.rg-udemy.location
  address_space       = ["192.168.0.0/24"]
  tags                = local.common_tags

}
# Deploy subnet
resource "azurerm_subnet" "snet" {
  name                 = "snet-udemy-terraform"
  resource_group_name  = azurerm_resource_group.rg-udemy.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.0.0/26"]
}