output "rg_name" {
  value = { for k, rg in azurerm_resource_group.the_resource_group : k => rg.name }
}
output "rg_id" {
  value = { for k, rg in azurerm_resource_group.the_resource_group : k => rg.id }
}
output "rg_location" {
  value = { for k, rg in azurerm_resource_group.the_resource_group : k => rg.location }
}