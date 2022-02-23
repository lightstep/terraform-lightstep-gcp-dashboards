terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.51.6"
    }
  }
  required_version = ">= v1.1.0"
}

provider "lightstep" {
  api_key_env_var = var.lightstep_api_key_env_var
  organization    = var.lightstep_organization
  environment     = var.lightstep_env
}

