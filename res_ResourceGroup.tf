resource "azurerm_resource_group" "the_resource_group" {
  for_each = var.ResourceGroup_input_data
  iterator = resourcegroup
  name     = resourcegroup[each.key].name
  location = resourcegroup[each.key].location
  tags     = resourcegroup[each.key].tags

}