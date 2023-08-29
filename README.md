# Terraform Module for Cloud Observability GCP Dashboards

**:warning:** You are viewing a **beta version** of the official
module to create and manage GCP-related dashboards inside Cloud Observability.

This is a Terraform module for deploying a pre-defined set of GCP-related dashboards in Cloud Observability meant to be used with the [Cloud Observability Google Cloud Monitoring integration](https://docs.lightstep.com/docs/setup-gcm-for-metrics).

## Pre-requisites

* Cloud Observability account and API Key with `member` permissions.
* [Metrics for Google Cloud Monitoring](https://docs.lightstep.com/docs/setup-gcm-for-metrics) sending data to a Cloud Observability project.
* Terraform v1.0+

## Supported GCP Resources

Each GCP resource has an associated module that will create Cloud Observability alerts. Currently, these resources are supported:

* __TODO__ (module: [`TODO`](https://github.com/lightstep/terraform-lightstep-aws-alerts/tree/master/modules/TODO))

## How to Use This Module

This repo has the following folder structure:

* [modules](https://github.com/lightstep/terraform-lightstep-gcp-dashboards/tree/master/modules): This folder contains several standalone, reusable, modules that you can use to create different types of Cloud Observability dashboards for GCP resources.
* [examples](https://github.com/lightstep/terraform-lightstep-gcp-dashboards/tree/master/examples): This folder shows examples of different ways to define creation of alerts.
* [root folder](https://github.com/lightstep/terraform-lightstep-gcp-dashboards/tree/master): The root folder is *an example* of how to use the terraform-gcp-dashboards module.
  module to create Cloud Observability GCP Dashboards. The Terraform Registry requires the root of every repo to contain Terraform code, so we've put one of the examples there. This example is great for learning and experimenting, but for production use, please use the underlying modules in the [modules folder](https://github.com/lightstep/terraform-lightstep-gcp-dashboards/tree/master/modules) directly.

To deploy create Cloud Observability alerts for production using this repo:

- Ensure account meets module pre-requisites from above.

- Create a Terraform configuration that pulls module(s) and specifies values
  of the required variables.

- Run `terraform init` and `terraform apply` with your API Key set in the environment variable `LIGHTSTEP_API_KEY` (or the environment variable name you specified in configuration).

## Development

This repository uses `pre-commit` to format and lint HCL code.

To install:

```
    $ brew install pre-commit
    $ pre-commit install
```