
data "digitalocean_ssh_keys" "all" {
  depends_on = [digitalocean_ssh_key.install]
}
