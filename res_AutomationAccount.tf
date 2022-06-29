resource "azurerm_automation_account" "the_automation_account" {
  for_each                      = var.AutomationAccount_input_data
  name                          = var.AutomationAccount_input_data[each.key].name
  location                      = var.AutomationAccount_input_data[each.key].location
  resource_group_name           = var.AutomationAccount_input_data[each.key].rg_name
  sku_name                      = var.AutomationAccount_input_data[each.key].sku_name == null ? "Basic" : var.AutomationAccount_input_data[each.key].sku_name
  public_network_access_enabled = var.AutomationAccount_input_data[each.key].public_network_access_enabled == null ? true : false
  dynamic "identity" {
    for_each = var.AutomationAccount_input_data[each.key].identity
    iterator = identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.type != "SystemAssigned" ? identity.value.identity_ids : null

    }
  }

  tags = var.AutomationAccount_input_data[each.key].tags
}