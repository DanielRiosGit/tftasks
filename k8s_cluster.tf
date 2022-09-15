module "gke" {
  source                 = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id             = var.project_id
  name                   = var.cluster_name
  regional               = true
  region                 = var.region
  network                = module.gcp-network.network_name
  subnetwork             = module.gcp-network.subnets_names[0]
  ip_range_pods          = var.ip_range_pods_name
  ip_range_services      = var.ip_range_services_name
  create_service_account = true
  node_pools = [
    {
      name           = "node-pool"
      machine_type   = "e2-medium"
      node_locations = "europe-west2-a,europe-west2-b"
      min_count      = 3
      max_count      = 3
      disk_size_gb   = 30
      auto_repair    = true
    },
    {
      name           = "node-pool2"
      machine_type   = "e2-medium"
      node_locations = "europe-west2-a"
      min_count      = 0
      max_count      = 4
      disk_size_gb   = 30
      preemptible    = true
    },
  ]
  remove_default_node_pool = true
  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "node-pool2"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }
}