terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.60.1"
    }
  }
  required_version = ">= v1.1.0"
}

resource "lightstep_metric_dashboard" "gcp_compute_networking_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "GCP Compute - terraform created"

  chart {
    name = "compute.googleapis.com/instance/uptime"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "compute.googleapis.com/instance/uptime"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}

