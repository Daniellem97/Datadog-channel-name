terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.60"
    }
  }
}

provider "datadog" {}

variable "CHANNEL_NAME" {
  description = "The Microsoft Teams channel name to integrate with Datadog"
  type        = string
}

resource "datadog_integration_ms_teams_tenant_based_handle" "iac_managed_teams_channel" {
  name         = "icon-work-space-"   # Datadog handle name (used inside Datadog)
  tenant_name  = "YourTenantName"     # Replace with your actual tenant
  team_name    = "YourTeamName"       # Replace with your actual team
  channel_name = var.CHANNEL_NAME     # Passed from Spacelift
}
