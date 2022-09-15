module "gcp-network" {
  source       = "terraform-google-modules/network/google"
  project_id   = var.project_id
  network_name = var.network
  subnets = [
    {
      subnet_name   = var.subnetwork
      subnet_ip     = "10.10.0.0/16"
      subnet_region = var.region
    },
  ]
  secondary_ranges = {
    "${var.subnetwork}" = [
      {
        range_name    = var.ip_range_pods_name
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name    = var.ip_range_services_name
        ip_cidr_range = "10.30.0.0/16"
      },
    ]
  }
}

resource "google_compute_route" "egress_internet" {
  depends_on       = [module.gcp-network]
  name             = "egress-internet"
  dest_range       = "0.0.0.0/0"
  network          = var.network
  next_hop_gateway = "default-internet-gateway"
}

resource "google_compute_router" "router" {
  depends_on = [module.gcp-network]
  name       = "${var.network}-router"
  region     = var.region
  network    = var.network
}

resource "google_compute_router_nat" "nat_router" {
  depends_on                         = [module.gcp-network]
  name                               = "${var.subnetwork}-nat-router"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = var.subnetwork
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}