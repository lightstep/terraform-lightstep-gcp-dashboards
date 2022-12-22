terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.10"
    }
  }
  required_version = ">= v1.1.0"
}

resource "lightstep_metric_dashboard" "gcp_cloud_storage_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "GCP Cloud Storage - terraform created"

  chart {
    name = "storage.googleapis.com/api/request_count"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "storage.googleapis.com/api/request_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = ["bucket_name", ]
      }

    }

  }

  chart {
    name = "storage.googleapis.com/storage/object_count"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "storage.googleapis.com/storage/object_count"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["bucket_name", ]
      }

    }

  }

  chart {
    name = "storage.googleapis.com/storage/total_bytes"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "storage.googleapis.com/storage/total_bytes"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["storage_class", ]
      }

    }

  }

}