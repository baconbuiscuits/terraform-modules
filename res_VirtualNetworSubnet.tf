resource "azurerm_subnet" "the_subnet" {
  for_each                                       = var.VirtualNetworkSubnet_input_data
  name                                           = var.VirtualNetwork_input_data[each.key].name
  resource_group_name                            = var.VirtualNetwork_input_data[each.key].rg_name
  virtual_network_name                           = var.VirtualNetwork_input_data[each.key].vnet_name
  address_prefixes                               = var.VirtualNetwork_input_data[each.key].address_prefixes
  enforce_private_link_endpoint_network_policies = var.VirtualNetwork_input_data[each.key].enforce_privendp_net_policies !=null ? var.VirtualNetwork_input_data[each.key].enforce_privendp_net_policies : false
  enforce_private_link_service_network_policies  = var.VirtualNetwork_input_data[each.key].enforce_privserv_net_policies != null ? var.VirtualNetwork_input_data[each.key].enforce_privserv_net_policies : false
  service_endpoints                              = var.VirtualNetwork_input_data[each.key].service_endpoints != null ? var.VirtualNetwork_input_data[each.key].service_endpoints : null
  service_endpoint_policy_ids                    = var.VirtualNetwork_input_data[each.key].service_endpoint_policy_ids != null ? var.VirtualNetwork_input_data[each.key].service_endpoint_policy_ids : null

  dynamic "delegation" {
    for_each = var.VirtualNetwork_input_data[each.key].delegation != null ? var.VirtualNetwork_input_data[each.key].delegation : null
    iterator = delegation
    content {
      name = "delegation"
      service_delegation {
        name    = "Microsoft.ContainerInstance/containerGroups"
        actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
      }
    }
  }
}
