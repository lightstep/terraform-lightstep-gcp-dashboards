terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.60.2"
    }
  }
  required_version = ">= v1.1.0"
}

resource "lightstep_metric_dashboard" "gcp_logging_metrics_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "GCP Logging Metrics - terraform created"

  chart {
    name = "Logging Metrics"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "logging.googleapis.com/billing/bytes_ingested"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = ["resource_type", ]
      }

    }

  }

  chart {
    name = "logging.googleapis.com/log_entry_count"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "logging.googleapis.com/log_entry_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "logging.googleapis.com/exports/byte_count"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "logging.googleapis.com/exports/byte_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}