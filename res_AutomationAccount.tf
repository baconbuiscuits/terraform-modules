resource "azurerm_automation_account" "the_automation_account" {
  for_each                      = var.AutomationAccount_input_data
  iterator = automationaccount
  name                          = automationaccount.value.name
  location                      = automationaccount.value.location
  resource_group_name           = automationaccount.value.rg_name
  sku_name                      = automationaccount.value.sku_name == null ? "Basic" : automationaccount.value.sku_name
  public_network_access_enabled = automationaccount.value.public_network_access_enabled == null ? true : false
  dynamic "identity" {
    for_each = automationaccount.value.identity
    iterator = identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.type != "SystemAssigned" ? identity.value.identity_ids : null

    }
  }

  tags = var.AutomationAccount_input_data.value.tags
}