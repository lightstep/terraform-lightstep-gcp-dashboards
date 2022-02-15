variable "lightstep_project" {
  description = "Name of Lightstep project"
  type        = string
  default     = "terraform-shop"
}

variable "lightstep_organization" {
  description = "Name of Lightstep organization"
  type        = string
  default     = "LightStep"
}

variable "lightstep_env" {
  description = "Lightstep environment"
  type        = string
  default     = "staging"
}

variable "lightstep_api_key_env_var" {
  description = "Name of the local environment variable that contains the Lightstep API key"
  type        = string
  default     = "LIGHTSTEP_API_KEY"
}