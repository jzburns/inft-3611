provider "google" {
}

resource "google_storage_bucket" "bucket" {
  name     = format("%s-%s", var.project_id, var.gcp_id)
  location = "ME-CENTRAL1"
}

resource "google_storage_bucket_object" "archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.bucket.name
  source = "./gcf/index.zip"
}

resource "google_cloudfunctions_function" "function" {
  name        = "${var.gcp_id}-helloGET"
  description = "Hello World Function"
  runtime     = "nodejs20"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "helloGET"
  region                = var.region
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = var.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
