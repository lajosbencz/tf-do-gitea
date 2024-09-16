resource "digitalocean_droplet" "gitea" {
  image      = "docker-20-04"
  name       = "gitea"
  region     = var.region
  tags       = var.tags
  size       = local.droplet_size
  ssh_keys   = local.ssh_key_ids
  volume_ids = [data.digitalocean_volume.gitea_data.id]

  backups       = false
  monitoring    = false
  droplet_agent = false

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = tls_private_key.install.private_key_openssh
  }

  provisioner "file" {
    content     = local.tpl_docker_compose
    destination = "/tmp/docker-compose.yaml"
  }

  provisioner "file" {
    content     = local.tpl_gitea_ini
    destination = "/tmp/gitea.ini"
  }

  provisioner "file" {
    content     = local.tpl_init_sh
    destination = "/tmp/init.sh"
  }

  provisioner "remote-exec" {
    on_failure = fail
    inline = [
      "bash /tmp/init.sh && rm -f /tmp/init.sh",
      "curl -sSL https://repos.insights.digitalocean.com/install.sh | bash",
    ]
  }

  lifecycle {
    ignore_changes = [user_data]
  }
}
