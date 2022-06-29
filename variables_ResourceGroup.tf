variable "ResourceGroup_input_data" {
  description = "Resource group input data"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string))
  }))
  default = {}
}
