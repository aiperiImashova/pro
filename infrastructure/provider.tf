provider "google" {
  # credentials = file("<path-to-service-account-key>.json")
  project = var.project_id
  region  = var.region
}