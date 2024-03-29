terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.60.2"
    }
  }
  required_version = ">= v1.1.0"
}

resource "lightstep_metric_dashboard" "gcp_agent_dashboard" {
  project_name   = var.cloud_observability_project
  dashboard_name = "GCP Agent- terraform created"

  chart {
    name = "Agent"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "agent.googleapis.com/agent/request_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = ["instance_id", ]
      }

    }

  }

  chart {
    name = "agent.googleapis.com/agent/memory_usage"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "agent.googleapis.com/agent/memory_usage"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "agent.googleapis.com/agent/uptime"
    rank = "5"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "agent.googleapis.com/agent/uptime"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}