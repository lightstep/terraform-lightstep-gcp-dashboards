terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.60.0"
    }
  }
  required_version = ">= v1.0.11"
}

# TODO: Add dashboards for module here