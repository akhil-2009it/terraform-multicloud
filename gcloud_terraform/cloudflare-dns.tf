# cloudflare-dns.tf | Define cloudflare provider and create DNS records

# Define Cloudflare provider
provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}


# Create www record for Google Cloud
resource "cloudflare_record" "gcp-www" {
  zone_id    = var.cloudflare_zone_id
  name       = "www"
  value      = google_compute_address.gcp-web-ip.address
  type       = "A"
  proxied    = true
  depends_on = [google_compute_address.gcp-web-ip]
}


# Create root record for Google Cloud
resource "cloudflare_record" "gcp-root" {
  zone_id    = var.cloudflare_zone_id
  name       = "@"
  value      = google_compute_address.gcp-web-ip.address
  type       = "A"
  proxied    = true
  depends_on = [google_compute_address.gcp-web-ip]
}


# Output GCP
output "cloudflare-gcp-www-record-id" {
  value = cloudflare_record.gcp-www.id
}

output "cloudflare-gcp-www-record-hostname" {
  value = cloudflare_record.gcp-www.hostname
}

output "cloudflare-gcp-root-record-id" {
  value = cloudflare_record.gcp-root.id
}

output "cloudflare-gcp-root-record-hostname" {
  value = cloudflare_record.gcp-root.hostname
}
