resource "azurerm_resource_group" "the_resource_group" {
  for_each = var.ResourceGroup_input_data
  iterator = resourcegroup
  name     = resourcegroup.value.name
  location = resourcegroup.value.location
  tags     = resourcegroup.value.tags

}