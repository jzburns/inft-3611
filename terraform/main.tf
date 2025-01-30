resource "google_compute_instance_template" "template_example" {
  name         = "my-instance-template"
  machine_type = "e2-standard-4"

  disk {
    source_image = "debian-cloud/debian-11"
    disk_size_gb = 250
  }

  network_interface {
    network = "default"

    # default access config, defining external IP configuration
    access_config {
      network_tier = "PREMIUM"
    }
  }

  # To avoid embedding secret keys or user credentials in the instances, Google recommends that you use custom service accounts with the following access scopes.
  service_account {
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
