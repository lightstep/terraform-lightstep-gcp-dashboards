resource "lightstep_metric_dashboard" "exported_dashboard" {
  project_name = var.project
  dashboard_name = "Compute Networking New Dashboard"

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

}