resource "digitalocean_volume" "gitea_data" {
  name   = var.volume_name
  size   = var.volume_size
  region = var.region

  lifecycle {
    prevent_destroy = true
  }
}
