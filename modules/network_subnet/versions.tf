terraform {
  required_version = "=1.0.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "=3.84.0"
    }
  }
}