variable "credentials"{
    description ="My Credentials"
    default = "./keys/my-cred.json"
    }

variable "project"{
    description ="Project"
    default = "US"
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
    default = "demo_dataset"
}
variable "gcs_storage_name"{
    description ="My storage bucket name"
    default = "demo_dataset"
}

variable "gcs_storage_class"{
    description ="Bucket Storage Class"
    default = "STANDARD"
}

variable "gcs_storage_class"{
    description ="Bucket Storage Class"
    default = "demo_dataset"
}