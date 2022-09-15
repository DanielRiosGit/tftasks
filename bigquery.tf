resource "google_bigquery_dataset" "vmo2_tech_test" {
  dataset_id    = var.dataset_name
  friendly_name = var.dataset_name
  description   = "vmo2 dataset test"
  location      = "EU"
  project       = var.project_id
}

module "bigquery_dataset_access_vmo2_tech_test" {
  source = "./modules/bigquery"

  dataset_id    = google_bigquery_dataset.vmo2_tech_test.dataset_id
  user_by_email = var.user_by_email
}