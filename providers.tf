terraform {
  required_providers {
    aws = "~> 2.39.0"

    google      = "~> 2.18.0"
    google-beta = "~> 2.18.0"

    azurerm = "~> 2.42.0"
  }
}

provider "aws" {
  region = var.aws_region
}

provider "google" {
  credentials = file(pathexpand("/root/.config/gcloud/${var.google_service_account_json}"))
  region      = var.google_region
  project     = var.google_project_id
}

provider "google-beta" {
  credentials = file(pathexpand("/root/.config/gcloud/${var.google_service_account_json}"))
  region      = var.google_region
  project     = var.google_project_id
}

provider "azurerm" {
  features {}
}
