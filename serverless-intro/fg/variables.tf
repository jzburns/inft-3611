variable "project_id" {
  description = "The project ID to deploy resources into"
  default     = "inft-3611"
}

variable "gcp_id" {
  description = "What is your gcp ID? (no @ sign reguired)"
}

variable "region" {
  description = "The GCP region for the functions"
  type        = string
  default     = "europe-west1"
}

variable "client_email" {
  description = "Service account email address"
  type        = string
  default     = ""
}
