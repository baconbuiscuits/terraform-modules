output "vnet_id" {
  value = { for k, vnet in azurerm_virtual_network.the_virtual_network : k => vnet.id }
}

output "vnet_name" {
  value = { for k, vnet in azurerm_virtual_network.the_virtual_network : k => vnet.name }
}

output "vnet_rgname" {
  value = { for k, vnet in azurerm_virtual_network.the_virtual_network : k => vnet.resource_group_name }
}

output "vnet_location" {
  value = { for k, vnet in azurerm_virtual_network.the_virtual_network : k => vnet.location }
}

output "vnet_address_space" {
  value = { for k, vnet in azurerm_virtual_network.the_virtual_network : k => vnet.address_space }
}

output "vnet_guid" {
  value = { for k, vnet in azurerm_virtual_network.the_virtual_network : k => vnet.guid }
}
