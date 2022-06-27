variable "input_data" {
  description = "Resource group input data"
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}