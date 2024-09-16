
output "volume_id" {
  description = "DigitalOcean Block Volume ID"
  value       = module.volume.volume_id
}

output "ipv4" {
  description = "Public IPv4 address of deployment"
  value       = module.deployment.ipv4
}

output "fqdn" {
  description = "Fully qualified domain name of deployment"
  value       = module.deployment.fqdn
}

output "address" {
  description = "HTTP address of deployment"
  value       = "https://${module.deployment.fqdn}/"
}

output "admin_user" {
  description = "Gitea admin user"
  value       = local.admin_user
}

output "admin_password" {
  description = "Gitea admin password"
  value       = local.admin_password
}
