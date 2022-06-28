resource "azurerm_resource_group" "the_resource_group" {
  for_each = var.ResourceGroup_input_data
  name     = var.ResourceGroup_input_data[each.key].name
  location = var.ResourceGroup_input_data[each.key].location
  tags     = var.ResourceGroup_input_data[each.key].tags

}