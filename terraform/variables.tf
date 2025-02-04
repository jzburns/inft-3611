variable "template_name" {
  ## set this by using the export command, eg: 
  ## export TF_VAR_template_name=MyGitID:$RANDOM
  description = "This is the template ID to avoid name colisions"
}
