terraform {
    backend "gcs" {}
}

provider "google" {
  project     = "my-project-id"
  region      = "us-central1"
}

resource "google_compute_network" "swarm_network" {
    name = var.gcp_network_name
    description = "Docker swarm network for ${var.gcp_environment}"
    auto_create_subnetworks = true
}

resource "google_compute_instance" "worker" {
    count = var.gcp_workers_number
}