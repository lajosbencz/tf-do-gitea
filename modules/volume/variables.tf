variable "do_token" {
  type      = string
  sensitive = true
}

variable "region" {
  type = string
}

variable "volume_size" {
  type    = number
  default = 5
}

variable "volume_name" {
  type    = string
  default = "gitea-data"
}
