resource "azurerm_resource_group" "the_resource_group" {
  for_each = var.input_data
  iterator = rule
  name     = rule.value.name
  location = rule.value.location
  tags     = rule.value.tags
}