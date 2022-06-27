resource "azurerm_resource_group" "the_resource_group" {
  for_each = var.input_data

  name     = var.input_data[each.key].name
  location = var.input_data[each.key].location
  tags     = var.input_data[each.key].tags
  
}