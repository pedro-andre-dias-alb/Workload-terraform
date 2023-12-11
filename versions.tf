terraform {
  required_version = ">= 1.3.6"
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.52.0"
    }
  }

}