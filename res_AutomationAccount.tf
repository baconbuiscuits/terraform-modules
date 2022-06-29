resource "azurerm_automation_account" "the_automation_account" {
  for_each                      = var.AutomationAccount_input_data
  name                          = var.AutomationAccount_input_data[each.key].name
  location                      = var.AutomationAccount_input_data[each.key].location
  resource_group_name           = var.AutomationAccount_input_data[each.key].rg_name
  sku_name                      = var.AutomationAccount_input_data[each.key].sku_name
  public_network_access_enabled = var.AutomationAccount_input_data[each.key].public_network_access_enabled
  dynamic "identity" {
    for_each = var.AutomationAccount_input_data[each.key].identity
    iterator = identity
    content {
      type         = var.AutomationAccount_input_data[each.key].identity.type
      identity_ids = var.AutomationAccount_input_data[each.key].identity.type != "SystemAssigned" ? var.AutomationAccount_input_data[each.key].identity.identity_ids : null

    }
  }

  tags = var.AutomationAccount_input_data[each.key].tags
}