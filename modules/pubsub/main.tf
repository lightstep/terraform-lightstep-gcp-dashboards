terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.60.2"
    }
  }
  required_version = ">= v1.1.0"
}

resource "lightstep_metric_dashboard" "gcp_pubsub_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "GCP Pubsub - terraform created"

  chart {
    name = "pubsub.googleapis.com/snapshot/config_updates_count"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "pubsub.googleapis.com/snapshot/config_updates_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = ["snapshot_id", "operation_type", ]
      }

    }

  }

  chart {
    name = "pubsub.googleapis.com/subscription/ack_latencies"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "pubsub.googleapis.com/subscription/delivery_latency_health_score"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "pubsub.googleapis.com/subscription/byte_cost"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "pubsub.googleapis.com/subscription/byte_cost"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}

