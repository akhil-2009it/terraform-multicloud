# common-variables.tf | shared variables

# Define application name
variable "app-name" {
  type = string
  description = "Application name"
  default = "akhil-multicloud-demo"
}

# Define application environment
variable "app-environment" {
  type = string
  description = "application environment"
  default = "demo"
}