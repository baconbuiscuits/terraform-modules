resource "azurerm_resource_group" "the_resource_group" {
  for_each = var.ResourceGroup_input_data
  iterator = RG

  name     = RG[each.key].name
  location = RG[each.key].location
  tags     = RG[each.key].tags

}