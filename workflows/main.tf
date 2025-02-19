provider "google" {
  project = "inft-3611"
}

# Enable Workflows API
resource "google_project_service" "default" {
  service            = "workflows.googleapis.com"
  disable_on_destroy = false
}

# Create a workflow
resource "google_workflows_workflow" "default" {
  name            = var.workflow_name
  region          = "us-central1"
  description     = "A sample workflow"
  service_account = "960957615762-compute@developer.gserviceaccount.com"

  deletion_protection = false # set to "true" in production

  labels = {
    env = "test"
  }
  user_env_vars = {
    url = "https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam"
  }
  source_contents = <<-EOF
  # This is a sample workflow that you can replace with your source code
  #
  # The workflow does the following:
  # - Retrieves the current date from a public API and stores the
  #   response in `currentDate`
  # - Retrieves a list of Wikipedia articles from a public API related
  #   to the day of the week stored in `currentDate`
  # - Returns the list of articles in the workflow output
  #
  # Note that when you define workflows in Terraform, variables must be
  # escaped with two dollar signs ($$) and not a single sign ($)

  - getCurrentDate:
      call: http.get
      args:
          url: $${sys.get_env("url")}
      result: currentDate
  - readWikipedia:
      call: http.get
      args:
          url: https://en.wikipedia.org/w/api.php
          query:
              action: opensearch
              search: $${currentDate.body.dayOfWeek}
      result: wikiResult
  - returnOutput:
      return: $${wikiResult.body[1]}
EOF

  depends_on = [google_project_service.default]
}
