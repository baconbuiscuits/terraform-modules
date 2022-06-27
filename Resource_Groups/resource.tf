resource "azurerm_resource_group" "the_resource_group" {
  name     = var.name
  location = var.location
}