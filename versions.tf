terraform {
  required_version = "=1.0.2"

  backend "gcs" {
    bucket = "tfstate-prasanth"    # Name of gcp cloud bucket
    prefix = "written-in-state.tf" # Path inside the bucket where state file will be created
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "=3.84.0"
    }
  }
}

provider "google" {
  project  = "trainingproject-1"
  region   = "us-central1"
  # location = "us-central1-c"
}