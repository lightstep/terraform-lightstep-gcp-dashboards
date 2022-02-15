terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.51.6"
    }
  }
  required_version = ">= v1.1.0"
}

resource "lightstep_metric_dashboard" "gcp_compute_networking_dashboard" {
  project_name = var.lightstep_project
  dashboard_name = "[ls-internal] New Dashboard"

  chart {
    name = "terraform-lightstep-gcp networking dashboards"
    rank = "0"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false

      metric              = "compute.googleapis.com/instance/network/received_packets_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys = ["instance_id",]
      }

    }

  }

  chart {
    name = "computer networking"
    rank = "5"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false

      metric              = "compute.googleapis.com/quota/instances_per_vpc_network/limit"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys = []
      }

    }

  }

}