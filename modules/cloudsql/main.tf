terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.51.6"
    }
  }
  required_version = ">= v1.1.0"
}

resource "lightstep_metric_dashboard" "gcp_cloudsql_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "GCP Cloudsql - terraform created"

  chart {
    name = "cloudsql.googleapis.com/database/cpu/utilization"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "cloudsql.googleapis.com/database/cpu/utilization"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}