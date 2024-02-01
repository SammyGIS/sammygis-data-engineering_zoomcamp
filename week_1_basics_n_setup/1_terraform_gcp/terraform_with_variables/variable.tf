variable "credentials"{
    description ="My Credentials"
    default = ""
    }

variable "project"{
    description ="Project"
    default = "data-enginerring-zoomcamp"
}

variable "region"{
    description ="Region"
    default = "us-central1"
}

variable "location"{
    description ="Project location"
    default = "US"
}
variable "bq_dataset_name"{
    description ="My BigQuery Dataset Name"
    default = "demo_dataset_sammygis"
}
variable "gcs_storage_name"{
    description ="My storage bucket name"
    default = "demo_storage_sammygis"
}

variable "gcs_storage_class"{
    description ="Bucket Storage Class"
    default = "STANDARD"
}
