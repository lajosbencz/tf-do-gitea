module "volume" {
  source      = "./modules/volume"
  do_token    = var.do_token
  region      = var.region
  volume_name = var.volume_name
  volume_size = var.volume_size
}

resource "random_id" "admin_password" {
  byte_length = 16
}

locals {
  admin_user     = length(var.admin_user) > 0 ? var.admin_user : "${trimspace(split("@", var.admin_email)[0])}"
  admin_password = length(var.admin_password) > 0 ? var.admin_password : random_id.admin_password.id
}

module "deployment" {
  deployment_depends_on = [module.volume.volume_id]
  source                = "./modules/deployment"
  do_token              = var.do_token
  region                = var.region
  volume_name           = var.volume_name
  ssh_port              = var.ssh_port
  ssh_key_name          = var.ssh_key_name
  tags                  = var.tags
  domain_zone           = var.domain_zone
  domain_sub            = var.domain_sub
  size                  = var.size
  swap_size             = var.swap_size
  gitea_version         = var.gitea_version
  gitea_runner_version  = var.gitea_runner_version
  gitea_app_name        = var.gitea_app_name
  gitea_ssh_port        = var.gitea_ssh_port
  admin_user            = local.admin_user
  admin_password        = local.admin_password
  admin_email           = var.admin_email
  ratelimit_average     = var.ratelimit_average
  ratelimit_burst       = var.ratelimit_average
}
