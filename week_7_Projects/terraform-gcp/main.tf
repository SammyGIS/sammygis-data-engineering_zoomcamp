terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("./keys/data-enginerring-zoomcamp-b8719aa4a43e.json")
  project = "data-enginerring-zoomcamp"
  region  = "us-east4"
}

# resource "google_service_account" "default" {
#   account_id   = "data-enginerring-zoomcamp"
#   display_name = "de-zoomcamp-project"
#   project      = "data-enginerring-zoomcamp" # Add your GCP project ID here
# }

resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "e2-standard-4"
  zone         = "us-east4-a"
  project      = "data-enginerring-zoomcamp" # Add your GCP project ID here

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-lts" 
      size = 100
      labels = {
        my_label = "project"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral public IP
    }

    metadata_startup_script = "${file("./install_docker.sh")}"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "farm-watch-project@data-enginerring-zoomcamp.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}


# bigquery
resource "google_bigquery_dataset" "dataset" {
  dataset_id = "sammy_project_dataset"
  project    = "data-enginerring-zoomcamp"
  location   = "US"

  labels = {
    env = "project"
  }
}


resource "google_storage_bucket" "bucket" {
  name     = "sammy_project_bucket2024"
  project  = "data-enginerring-zoomcamp"
  location = "US"
}

resource "google_cloudfunctions_function" "function" {
  name        = "gee_functions"
  description = "My function"
  project     = "data-enginerring-zoomcamp"
  runtime     = "python3.7"

  available_memory_mb   = 128
  source_archive_bucket = sammy_project_bucket2024
  trigger_http          = true
  entry_point           = "helloGET"
}

