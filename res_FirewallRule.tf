resource "azurerm_firewall_policy_rule_collection_group" "the_fw_rule" {
  name               = var.name
  firewall_policy_id = data.azurerm_firewall_policy.base_fw_policy.id
  priority           = var.rule_collection_priority
  lifecycle { ignore_changes = [firewall_policy_id] }


  dynamic "application_rule_collection" {
    for_each = var.app_rules
    iterator = rulecollection
    content {
      name     = join("-", [rulecollection.value.rc_name, "APP"])
      action   = rulecollection.value.action != null ? title(rulecollection.value.action) : "Allow"
      priority = rulecollection.value.priority != null ? rulecollection.value.priority : 2000
      dynamic "rule" {
        for_each = rulecollection.value.rules
        iterator = rule
        content {
          name = rule.value.name
          dynamic "protocols" {
            for_each = rule.value.protocols
            iterator = protocols
            content {
              type = protocols.value.protocol
              port = protocols.value.port
            }
          }
          source_addresses  = rule.value.source_addresses
          destination_fqdns = rule.value.destination_fqdns
        }
      }
    }
  }

  dynamic "network_rule_collection" {
    for_each = var.net_rules
    iterator = rulecollection
    content {
      name     = join("-", [rulecollection.value.rc_name, "NET"])
      action   = rulecollection.value.action != null ? title(rulecollection.value.action) : "Allow"
      priority = rulecollection.value.priority != null ? rulecollection.value.priority : 2000
      dynamic "rule" {
        for_each = rulecollection.value.rules
        iterator = rule
        content {
          name                  = rule.value.name
          protocols             = rule.value.protocols
          source_addresses      = rule.value.source_addresses
          destination_addresses = rule.value.destination_addresses
          destination_ports     = rule.value.destination_ports
        }
      }
    }
  }

  dynamic "nat_rule_collection" {
    for_each = var.nat_rules
    iterator = rulecollection
    content {
      name     = join("-", [rulecollection.value.rc_name, "NAT"])
      action   = rulecollection.value.action != null ? title(rulecollection.value.action) : "Dnat"
      priority = rulecollection.value.priority != null ? rulecollection.value.priority : 2000
      dynamic "rule" {
        for_each = rulecollection.value.rules
        iterator = rule
        content {
          name                = rule.value.name
          protocols           = rule.value.protocols
          source_addresses    = rule.value.source_addresses
          destination_address = rule.value.destination_address
          destination_ports   = rule.value.destination_ports
          translated_address  = rule.value.translated_address
          translated_port     = rule.value.translated_port
        }
      }
    }
  }
}


output "keys" {
  value = keys(var.net_rules)
}