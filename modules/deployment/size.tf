data "digitalocean_sizes" "cheapest" {
  filter {
    key    = "regions"
    values = [var.region]
  }

  filter {
    key    = "vcpus"
    values = [1]
  }

  filter {
    key    = "memory"
    values = [512]
  }

  sort {
    key       = "price_monthly"
    direction = "asc"
  }
}

locals {
  cheapest_droplet_slug = element(data.digitalocean_sizes.cheapest.sizes, 0).slug
  droplet_size          = length(var.size) > 0 ? var.size : local.cheapest_droplet_slug
}
