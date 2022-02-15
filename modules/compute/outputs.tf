output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.gcp_compute_networking_dashboard.id}"
  description = "SNS Dashboard URL"
}