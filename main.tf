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
    count           = var.gcp_workers_number
    name            =  "worker"
    machine_type    = var.gcp_manager_instance_type 
    zone            = var.gcp_zone
    can_ip_forward  = true

    boot_disk {
        initialize_params {
            image  = var.gcp_image_id
        }
    }

    network_interface {
        network = var.gcp_network_name
    }

    metadata = {
        environment = var.gcp_environment
    }
}