variable "VirtualNetwork_input_data" {
  description = "Virtual network input data"
  type = map(object({
    name                    = string
    rg_name                 = string
    location                = string
    address_space           = list(string)
    bgp_community           = optional(string)
    edge_zone               = optional(string)
    flow_timeout_in_minutes = optional(number)
    dns_servers             = list(string)
    tags                    = optional(map(string))
    ddos_protection_plan = optional(map(object({
      id     = string
      enable = bool
    })))
  }))
  default = {}
}

variable "bgp_as_number" {
  default = "12076"
}