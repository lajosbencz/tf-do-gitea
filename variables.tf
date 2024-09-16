variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
  sensitive   = true
}

variable "region" {
  type        = string
  description = "DigitalOcean region"
}

variable "size" {
  type        = string
  description = "DigitalOcean droplet size, defaults to cheapest"
}

variable "swap_size" {
  type        = string
  description = "Size for swap space, as used in fallocate"
  default     = "2G"
}

variable "volume_name" {
  type        = string
  description = "DigitalOcean volume name"
  default     = "gitea-data"
}

variable "volume_size" {
  type        = number
  description = "DigitalOcean volume size in GiB"
  default     = 5
}

variable "domain_zone" {
  type        = string
  description = "DigitalOcean domain zone under which the A record for Gitea should be added"
}

variable "domain_sub" {
  type        = string
  description = "The sub-domain where Gitea will be accessible"
  default     = "gitea"
}

variable "ssh_port" {
  type        = number
  description = "SSH port for sshd on host"
  default     = 2222
}

variable "ssh_key_name" {
  type        = string
  description = "Installation SSH key name on DigitalOcean, contents will be automatically generated"
  default     = "Terraform install key - Gitea"
}

variable "tags" {
  type        = list(string)
  description = "Tags for resources where applicable"
  default     = ["gitea"]
}

variable "gitea_version" {
  type        = string
  description = "Gitea image version (-rootless will be appended)"
  default     = "1"
}

variable "gitea_runner_version" {
  type        = string
  description = "Gitea Act Runner image version (-dind-rootless will be appended)"
  default     = "latest"
}

variable "gitea_app_name" {
  type    = string
  default = "What a lovely cuppa"
}

variable "gitea_ssh_port" {
  type        = number
  description = "Gitea SSH port, set to 0 to disable"
  default     = 22
}

variable "admin_email" {
  type        = string
  description = "Gitea admin email"
}

variable "admin_user" {
  type        = string
  description = "Gitea admin username, defaults to user part of email address"
  default     = ""
}

variable "admin_password" {
  type        = string
  description = "Gitea admin password, defaults to randomly generated"
  default     = ""
}

variable "ratelimit_average" {
  type        = number
  description = "Maximum rate, in requests per second, allowed from a given source"
  default     = 40
}

variable "ratelimit_burst" {
  type        = number
  description = "Maximum number of requests allowed to go through in a second"
  default     = 60
}
