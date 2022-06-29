resource "azurerm_automation_account" "the_automation_account" {
  for_each                      = var.AutomationAccount_input_data
  iterator = automationaccount
  name                          = automationaccount[each.key].name
  location                      = automationaccount[each.key].location
  resource_group_name           = automationaccount[each.key].rg_name
  sku_name                      = automationaccount[each.key].sku_name == null ? "Basic" : automationaccount[each.key].sku_name
  public_network_access_enabled = automationaccount[each.key].public_network_access_enabled == null ? true : false
  dynamic "identity" {
    for_each = automationaccount[each.key].identity
    iterator = identity
    content {
      type         = identity[each.key].type
      identity_ids = identity[each.key].type != "SystemAssigned" ? identity[each.key].identity_ids : null

    }
  }

  tags = var.AutomationAccount_input_data[each.key].tags
}