terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.35.0"
    }
  }
  backend "gcs" {
    bucket = "epsi-nathan"
    prefix = "terraform/state/nathan"
  }
}

provider "google" {
  project = "spherical-voice-428109-n5"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}
