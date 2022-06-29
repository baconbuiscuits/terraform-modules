output "rg_name" {
  #value = [for x in azurerm_resource_group.the_resource_group : x.name]
  value = {for k, rg in azurerm_resource_group.the_resource_group : k => rg.name}
}
output "rg_id" {
  value = [for x in azurerm_resource_group.the_resource_group : x.id]
  #value = azurerm_resource_group.the_resource_group[*].id
}
output "rg_location" {
  value = [for x in azurerm_resource_group.the_resource_group : x.location]
  #value = azurerm_resource_group.the_resource_group[*].location
}