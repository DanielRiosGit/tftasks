resource "google_bigquery_dataset_access" "this" {
  dataset_id    = var.dataset_id
  role          = var.role
  user_by_email = var.user_by_email
}