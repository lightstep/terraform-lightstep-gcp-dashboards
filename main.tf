terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.60.2"
    }
  }
  required_version = ">= v1.1.0"
}

provider "lightstep" {
  api_key_env_var = var.cloud_observability_api_key_env_var
  organization    = var.cloud_observability_organization
  environment     = var.cloud_observability_env
}

module "cloud_observability_compute_networking_dashboard" {
  source                      = "./modules/compute"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_cloud_storage_dashboard" {
  source                      = "./modules/storage"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_logging_metrics_dashboard" {
  source                      = "./modules/logging"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_service_runtime_dashboard" {
  source                      = "./modules/service-runtime"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_agent_dashboard" {
  source                      = "./modules/agent"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_bigtable_dashboard" {
  source                      = "./modules/bigtable"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_cloudsql_dashboard" {
  source                      = "./modules/cloudsql"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_pubsub_dashboard" {
  source                      = "./modules/pubsub"
  cloud_observability_project = var.cloud_observability_project
}

module "cloud_observability_kubernetes_dashboard" {
  source                      = "./modules/kubernetes"
  cloud_observability_project = var.cloud_observability_project
}