## GCP example workflow automation
Document reference: https://cloud.google.com/workflows/docs/overview

This example uses terraform to create and delete the workflow models. The standard process applies

1. ``terraform init`` : needs to be done *once* in order to configure the tf components
1. ``terraform plan`` : should be run any time you make a change to your components - it allows you to review changes before effecting them
1. ``export TF_VAR_workflow_name=$USER`` : should be run any time you open a **new** gcp shell
1. ``terraform apply`` : should be run any time you make a change to your components
1. ``terraform destroy`` : when you want to remove your components permanently

## Code example
The code we will automate today is a simple yaml workflow that is already included in our ``main.tf``:

```
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
```
![image](https://github.com/user-attachments/assets/96308ba8-5d49-46f8-9659-8f3c1b1661d9)
