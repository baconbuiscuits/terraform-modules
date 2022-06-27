resource "azurerm_resource_group" "the_resource_group" {
  for_each = var.input_data
  iterator = RG
  name     = RG.value.name
  location = RG.value.location
  tags     = RG.value.tags
}