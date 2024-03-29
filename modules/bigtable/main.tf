terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.60.2"
    }
  }
  required_version = ">= v1.1.0"
}

resource "lightstep_metric_dashboard" "gcp_bigtable_dashboard" {
  project_name   = var.cloud_observability_project
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

  chart {
    name = "bigtable.googleapis.com/cluster/cpu_load"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "bigtable.googleapis.com/cluster/cpu_load"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "bigtable.googleapis.com/cluster/cpu_load_hottest_node"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "bigtable.googleapis.com/cluster/cpu_load_hottest_node"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}