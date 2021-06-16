# cloudflare-variables.tf | Variables for the Cloudflare module

# Cloudflare email
variable "cloudflare_email" {
  type        = string
  description = "Cloudflare Email Address"
  default = "akhil.it20091@gmail.com"
}

# Cloudflare API key
variable "cloudflare_api_key" {
  type        = string
  description = "Cloudflare API Key"
  default = "90c523762b0be6dc0823473a8b2069f211c48"
}

# Cloudflare zone id
variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflare Zone ID"
  default = "27da8a029018f91ca9a3c5e2d438e378"
  
}
