
resource "digitalocean_loadbalancer" "lb" {
  name      = var.name
  region    = var.region
  vpc_uuid  = var.vpc_id

  forwarding_rule {
    tls_passthrough = var.tls_passthrough
    entry_port     = 443
    entry_protocol = "https"

    target_port     = var.target_port
    target_protocol = "https"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = var.target_droplets
}
