resource "azurerm_resource_group" "rg-udemy" {
  name     = "rg-udemy-terraform"
  location = "eastus"
  tags     = local.common_tags # Importante: o nome do arquivo é no plural mas o bloco é no singular
}