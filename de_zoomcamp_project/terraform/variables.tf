variable "credentials"{
    description = "My Credentials"
    default = "C:\Users\scl\Downloads\GCP_Keys\my_keys.json"
} 

variable "region"{
    description = "Region"
    default = "us-cemtral1"
} 

variable "project"{
    description = "Project Description"
    default = "dezoomcamp-411909"
} 

variable "location"{
    description = "Project Location"
    default = "US"
} 

variable "gcs_bucket_name"{
    description = "My Storage Name"
    default = "de_project_covid_dataset"
} 

variable "gcs_storage_class"{
    description = "Bucket Storage Class"
    default = "STANDARD"
}

variable "bq_dataset_name"{
    description = "My BigQuery Dataset Name"
    default = "covid_dataset_de_project"
}
