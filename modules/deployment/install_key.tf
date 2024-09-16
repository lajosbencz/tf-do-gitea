resource "tls_private_key" "install" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "digitalocean_ssh_key" "install" {
  name       = var.ssh_key_name
  public_key = tls_private_key.install.public_key_openssh
}
