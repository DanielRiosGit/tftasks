variable "project_id" {
  description = "Please enter your project ID to host the cluster in:"
}

variable "cluster_name" {
  description = "The name for the GKE cluster"
  default     = "vmo2-cluster"
}

variable "region" {
  description = "The region to host the cluster in"
  default     = "europe-west2"
}

variable "network" {
  description = "The VPC network created to host the cluster in"
  default     = "vmo2-network"
}

variable "subnetwork" {
  description = "The subnetwork created to host the cluster in"
  default     = "vmo2-subnet"
}

variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}

variable "ip_range_services_name" {
  description = "The secondary ip range to use for services"
  default     = "ip-range-services"
}

variable "dataset_name" {
  description = "The name for the dataset"
  default     = "vmo2_tech_test"
}

variable "user_by_email" {
  description = "Please enter the Google email address of user to give the dataEditor role in the Big Query dataset:"
}