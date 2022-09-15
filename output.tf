output "cluster_name" {
  description = "Cluster name"
  value       = module.gke.name
}

output "service_account" {
  description = "The default service account used for running nodes."
  value       = module.gke.service_account
}