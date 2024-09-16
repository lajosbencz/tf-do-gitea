variable "do_token" {
  type      = string
  sensitive = true
}

variable "region" {
  type = string
}

variable "size" {
  type = string
}

variable "swap_size" {
  type = string
}

variable "volume_name" {
  type = string
}

variable "domain_zone" {
  type = string
}

variable "domain_sub" {
  type    = string
  default = "gitea"
}

variable "ssh_port" {
  type    = number
  default = 2222
}

variable "ssh_key_name" {
  type = string
}

variable "tags" {
  type    = list(string)
  default = ["gitea"]
}

variable "gitea_version" {
  type    = string
  default = "1"
}

variable "gitea_runner_version" {
  type    = string
  default = "latest"
}

variable "gitea_app_name" {
  type = string
}

variable "gitea_ssh_port" {
  type    = number
  default = 22
}

variable "admin_user" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "admin_email" {
  type = string
}

variable "ratelimit_average" {
  type = number
}

variable "ratelimit_burst" {
  type = number
}
