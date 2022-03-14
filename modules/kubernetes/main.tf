terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.60.1"
    }
  }
  required_version = ">= v1.1.0"
}

resource "lightstep_metric_dashboard" "kubernetes_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "Kubernetes Metric Dashboards"

  chart {
    name = "GCP Kubernetes Container Req Utilization"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "kubernetes.io/container/request_utilization"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = ["container_id", ]
      }

    }

  }

}