
data "digitalocean_volume" "gitea_data" {
  depends_on = [var.deployment_depends_on]
  name       = var.volume_name
}
