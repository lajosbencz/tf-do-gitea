locals {
  tpl_init_sh = templatefile("${path.module}/templates/init.sh", {
    disk_by_id     = local.disk_by_id
    swap_size      = var.swap_size
    ssh_port       = var.ssh_port
    gitea_ssh_port = var.gitea_ssh_port
    uid            = local.uid
    gid            = local.gid
    admin_user     = var.admin_user
    admin_password = var.admin_password
    admin_email    = var.admin_email
  })

  tpl_gitea_ini = templatefile("${path.module}/templates/gitea.ini", {
    secret_key          = random_id.secret_key.id
    lfs_jwt_secret      = random_id.lfs_jwt_secret.id
    internal_token      = random_id.internal_token.id
    jwt_secret          = random_id.jwt_secret.id
    gitea_app_name      = var.gitea_app_name
    gitea_ssh_port      = var.gitea_ssh_port
    gitea_ssh_disable   = var.gitea_ssh_port > 0 ? "false" : "true"
    gitea_runner_enable = length(var.gitea_runner_version) > 0
    domain_fqdn         = local.domain_fqdn
    domain_zone         = var.domain_zone
  })

  tpl_docker_compose = templatefile("${path.module}/templates/docker-compose.yaml", {
    gitea_version        = var.gitea_version
    gitea_runner_version = var.gitea_runner_version
    gitea_ssh_port       = var.gitea_ssh_port
    acme_email           = var.admin_email
    domain_fqdn          = local.domain_fqdn
    uid                  = local.uid
    gid                  = local.gid
    traefik_version      = local.traefik_version
    ratelimit_average    = var.ratelimit_average
    ratelimit_burst      = var.ratelimit_average
  })
}
