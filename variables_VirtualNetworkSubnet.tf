variable "VirtualNetworkSubnet_input_data" {
  description = "Virtual network subnet input data"
  type = map(object({
    name                          = string
    rg_name                       = string
    vnet_name                     = string
    address_prefixes              = list(string)
    enforce_privendp_net_policies = optional(bool)
    enforce_privserv_net_policies = optional(bool)
    service_endpoints             = optional(number)
    service_endpoint_policy_ids   = optional(list(string))
    tags                          = optional(map(string))
    delegation = optional(map(object({
      name = string
      enable = map(object({
        name    = string
        actions = list(string)
      }))
    })))
  }))
  default = {}
}