variable "dataset_id" {
  description = "A unique ID for this dataset, without the project name."
  type        = string
}

variable "role" {
  description = "Describes the rights granted to the user specified by the other member of the access object."
  type        = string
  default     = "roles/bigquery.dataEditor"
}

variable "user_by_email" {
  description = "An email address of a user to grant access to."
  type        = string
}