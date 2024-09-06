provider "google" {
  # credentials = file("<path-to-service-account-key>.json")
  project = var.project_id
  region  = var.region
}

resource "random_integer" "int" {
  min = 100
  max = 1000000
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 3.66"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}