terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("./key/data-enginerring-zoomcamp-b8719aa4a43e.json")
}

resource "google_service_account" "default" {
  account_id   = "my-custom-sa"
  display_name = "sammy-gis"
}

resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "e2-standard-2"
  zone         = "us-central1-a"


  boot_disk {
    initialize_params {
      image = "ubuntu 20.04 lts"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "farm-watch-project@data-enginerring-zoomcamp.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}

