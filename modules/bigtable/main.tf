terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.51.6"
    }
  }
  required_version = ">= v1.1.0"
}

resource "lightstep_metric_dashboard" "gcp_bigtable_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "GCP BigTable dashboard - terraform created"

  chart {
    name = "bigtable.googleapis.com/server/request_count"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "bigtable.googleapis.com/server/request_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = ["method", ]
      }

    }

  }

}