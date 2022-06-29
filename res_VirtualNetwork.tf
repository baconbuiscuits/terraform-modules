resource "azurerm_virtual_network" "the_virtual_network" {
  for_each                = var.VirtualNetwork_input_data
  name                    = var.VirtualNetwork_input_data[each.key].name
  resource_group_name     = var.VirtualNetwork_input_data[each.key].rg_name
  location                = var.VirtualNetwork_input_data[each.key].location
  address_space           = var.VirtualNetwork_input_data[each.key].address_space
  bgp_community           = var.VirtualNetwork_input_data[each.key].bgp_community != null ? join(":", [var.bgp_as_number, var.VirtualNetwork_input_data[each.key].bgp_community]) : null
  edge_zone               = var.VirtualNetwork_input_data[each.key].edge_zone
  flow_timeout_in_minutes = var.VirtualNetwork_input_data[each.key].flow_timeout_in_minutes != null ? var.VirtualNetwork_input_data[each.key].flow_timeout_in_minutes : null
  dns_servers             = var.VirtualNetwork_input_data[each.key].dns_servers

  dynamic "ddos_protection_plan" {
    for_each = var.VirtualNetwork_input_data[each.key].ddos_protection_plan != null ? [var.VirtualNetwork_input_data[each.key].ddos_protection_plan] : []
    iterator = ddos_protection_plan
    content {
      id     = ddos_protection_plan.id
      enable = ddos_protection_plan.enable
    }
  }

  tags = var.VirtualNetwork_input_data[each.key].tags
}