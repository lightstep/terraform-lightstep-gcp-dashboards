terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.60.1"
    }
  }
  required_version = ">= v1.1.0"
}

resource "lightstep_metric_dashboard" "gcp_service_runtime_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "GCP Service Runtime - terraform created"

  chart {
    name = "Service-runtime"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "serviceruntime.googleapis.com/api/request_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = ["service", ]
      }

    }

  }

}