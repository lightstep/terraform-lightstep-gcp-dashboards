output "lightstep_compute_networking_dashboard_url" {
  value       = module.lightstep_compute_networking_dashboard.dashboard_url
  description = "Lightstep GCP Compute Networking Dashboard URL"
}

output "lightstep_cloud_storage_dashboard_url" {
  value       = module.lightstep_cloud_storage_dashboard.dashboard_url
  description = "Lightstep GCP Cloud Storage Dashboard URL"
}