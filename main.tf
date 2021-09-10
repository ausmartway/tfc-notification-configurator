##main.tf
provider "tfe" {
  ##Please add your TFE token to TFE_TOKEN enviroment variable. 
  ##This token need to have permission to read all managed workspaces and write variables
  ## By default this provider manages TFC, to manage an TFE enviroment, set TFE_HOSTNAME envirioment variable to the hostname of you TFE.
}

data "tfe_workspace_ids" "customerfacing" {
  tag_names    = ["customerfacing"]
  organization = var.organization
}


resource "tfe_notification_configuration" "notification_for_customerfacing" {
  for_each         = data.tfe_workspace_ids.customerfacing.ids
  name             = "notification_for_customerfacing"
  enabled          = true
  destination_type = "slack"
  triggers         = ["run:needs_attention", "run:errored"]
  url              = "https://hooks.slack.com/services/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"
  workspace_id     = each.value
}