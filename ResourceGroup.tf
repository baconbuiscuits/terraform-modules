resource "azurerm_resource_group" "the_resource_group" {
  for_each = var.input_data
  iterator = RG
  name     = RG.name
  location = RG.location
  tags     = RG.tags
}