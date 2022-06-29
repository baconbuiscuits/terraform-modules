variable "AutomationAccount_input_data" {
  description = "Automation account input data"
  type = map(object({
    name                          = string
    rg_name                       = string
    location                      = string
    sku_name                      = optional(string)
    public_network_access_enabled = optional(string)
    tags                          = optional(map(string))
    identity = optional(map(object({
      type         = string
      identity_ids = list(string)
    })))
  }))
  default = {}
}