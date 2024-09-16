
resource "digitalocean_record" "gitea" {
  type   = "A"
  domain = var.domain_zone
  name   = var.domain_sub
  value  = digitalocean_droplet.gitea.ipv4_address
}
