# cloudflare-dns.tf | Define cloudflare provider and create DNS records

# Define Cloudflare provider
provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

# Create www record for Azure
resource "cloudflare_record" "azure-www" {
  zone_id    = var.cloudflare_zone_id
  name       = "www"
  value      = azurerm_public_ip.azure-web-ip.ip_address
  type       = "A"
  proxied    = true
  depends_on = [azurerm_public_ip.azure-web-ip]
}

# Create root record for Azure
resource "cloudflare_record" "azure-root" {
  zone_id    = var.cloudflare_zone_id
  name       = "@"
  value      = azurerm_public_ip.azure-web-ip.ip_address
  type       = "A"
  proxied    = true
  depends_on = [azurerm_public_ip.azure-web-ip]
}


# Output Azure
output "cloudflare-azure-www-record-id" {
  value = cloudflare_record.azure-www.id
}

output "cloudflare-azure-www-record-hostname" {
  value = cloudflare_record.azure-www.hostname
}

output "cloudflare-azure-root-record-id" {
  value = cloudflare_record.azure-root.id
}

output "cloudflare-azure-root-record-hostname" {
  value = cloudflare_record.azure-root.hostname
}

