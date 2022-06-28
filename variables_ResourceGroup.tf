variable "ResourceGroup_input_data" {
  description = "Resource group input data"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string))
  }))
  default = {
    "key" = {
      location = "westeurope"
      name     = "default_name"
      tags = {
        "no-tags" = "no-tags"
      }
    }
  }
}
