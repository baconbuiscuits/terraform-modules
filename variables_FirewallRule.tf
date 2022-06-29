# ###################################
# ### RULES COLLECTION VARIABLES  ###
# ###################################

# variable "name" {
#   description = "firewall policy rule collection name"
#   default = null
#   type        = string
# }
# variable "rule_collection_priority" {
#   description = "priority of this rule collection"
#   default = null
#   type        = number
# }

# ###################################
# ### APPLICATION RULES VARIABLES ###
# ###################################
# variable "app_rules" {
#   description = "app rules collection"
#   type = map(object({
#     rc_name  = string
#     priority = optional(number)
#     action   = optional(string)
#     rules = map(object({
#       name              = string
#       source_addresses  = list(string)
#       destination_fqdns = list(string)
#       protocols = map(object({
#         protocol = string
#         port     = number
#       }))
#     }))
#   }))
#   default = {}
# }

# ###################################
# ###   NETWORK RULES VARIABLES   ###
# ###################################
# variable "net_rules" {
#   description = "net rules collection"
#   type = map(object({
#     rc_name  = string
#     priority = optional(number)
#     action   = optional(string)
#     rules = map(object(
#       {
#         name                  = string
#         protocols             = list(string)
#         source_addresses      = list(string)
#         destination_addresses = list(string)
#         destination_ports     = list(string)
#     }))
#   }))
#   default = {}
# }


# ###################################
# ###     NAT RULES VARIABLES     ###
# ###################################

# variable "nat_rules" {
#   description = "nat rules collection"
#   type = map(object({
#     rc_name  = string
#     priority = optional(number)
#     action   = optional(string)
#     rules = map(object({
#       name                = string
#       protocols           = list(string)
#       source_addresses    = list(string)
#       destination_address = string
#       destination_ports   = list(string)
#       translated_address  = string
#       translated_port     = string
#     }))
#   }))
#   default = {}
# }