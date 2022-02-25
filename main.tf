terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.60.1"
    }
  }
  required_version = ">= v1.1.0"
}

provider "lightstep" {
  api_key_env_var = var.lightstep_api_key_env_var
  organization    = var.lightstep_organization
  environment     = var.lightstep_env
}

module "lightstep_compute_networking_dashboard" {
  source            = "./modules/compute"
  lightstep_project = var.lightstep_project
}

module "lightstep_cloud_storage_dashboard" {
  source            = "./modules/storage"
  lightstep_project = var.lightstep_project
}

module "lightstep_logging_metrics_dashboard" {
  source            = "./modules/logging"
  lightstep_project = var.lightstep_project
}

module "lightstep_service_runtime_dashboard" {
  source            = "./modules/service-runtime"
  lightstep_project = var.lightstep_project
}

module "lightstep_agent_dashboard" {
  source            = "./modules/agent"
  lightstep_project = var.lightstep_project
}