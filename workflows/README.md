## GCP example workflow automation

This example uses terraform to create and delete the workflow models. The standard process applies

1. ``terraform init`` : needs to be done *once* in order to configure the tf components
1. ``terraform plan`` : should be run any time you make a change to your components - it allows you to review changes before effecting them
1. ``export TF_VAR_workflow_name=$USER`` : should be run any time you open a **new** gcp shell
1. ``terraform apply`` : should be run any time you make a change to your components
1. ``terraform destroy`` : when you want to remove your components permanently
