resource "azurerm_virtual_network" "the_virtual_network" {
  for_each                = var.VirtualNetwork_input_data
  name                    = var.VirtualNetwork_input_data[each.key].name
  resource_group_name     = var.VirtualNetwork_input_data[each.key].rg_name
  location                = var.VirtualNetwork_input_data[each.key].location
  address_space           = var.VirtualNetwork_input_data[each.key].address_space
  bgp_community           = join(":", [var.bgp_as_number, var.VirtualNetwork_input_data[each.key].bgp_community])
  edge_zone               = var.VirtualNetwork_input_data[each.key].edge_zone
  flow_timeout_in_minutes = var.VirtualNetwork_input_data[each.key].flow_timeout_in_minutes


  dynamic "ddos_protection_plan" {
    for_each = var.VirtualNetwork_input_data[each.key].ddos_protection_plan != null ? [var.VirtualNetwork_input_data[each.key].ddos_protection_plan] : []
    iterator = ddos_protection_plan
    content {
      id     = ddos_protection_plan.id
      enable = ddos_protection_plan.enable
    }
  }

  tags     = var.VirtualNetwork_input_data[each.key].tags
}


resource "azurerm_virtual_network_dns_servers" "the_dns_servers" {
  for_each           = var.VirtualNetwork_input_data
  virtual_network_id = azurerm_virtual_network.the_virtual_network.id
  dns_servers        = var.VirtualNetwork_input_data[each.key].dns_servers
}

# resource "azurerm_subnet" "the_subnet" {
#   name                 = "example-subnet"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.1.0/24"]

#   delegation {
#     name = "delegation"

#     service_delegation {
#       name    = "Microsoft.ContainerInstance/containerGroups"
#       actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
#     }
#   }
# }


#dns servers
#subnets
