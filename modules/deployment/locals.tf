locals {
  uid             = 1000
  gid             = 1000
  ssh_key_ids     = data.digitalocean_ssh_keys.all.ssh_keys.*.id
  disk_by_id      = "/dev/disk/by-id/scsi-0DO_Volume_${data.digitalocean_volume.gitea_data.name}"
  domain_fqdn     = "${var.domain_sub}.${var.domain_zone}"
  traefik_version = "3.1"
}
