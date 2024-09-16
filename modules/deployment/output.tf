
output "droplet_id" {
  value = digitalocean_droplet.gitea.id
}

output "ipv4" {
  value = digitalocean_droplet.gitea.ipv4_address
}

output "fqdn" {
  value = digitalocean_record.gitea.fqdn
}
