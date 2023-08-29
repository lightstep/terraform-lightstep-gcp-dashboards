output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_metric_dashboard.gcp_cloudsql_dashboard.id}"
  description = "SNS Dashboard URL"
}