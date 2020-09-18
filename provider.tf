#
#
terraform {
  required_version = ">= 0.12"

  backend "gcs" {
    bucket = "pubsub-test-terraform-state"
    prefix = "terraform.tfstate"
    credentials = "~/terraform_key/sdns-prd-273508-82048fb6e653.json"
  }
}

provider "google" {
  version = "~> 3.0"

  region      = var.region
  credentials = file(var.credentials_file_path)
  project     = var.project
}

provider "google-beta" {
  version = "~> 3.1"

  region      = var.region
  credentials = file(var.credentials_file_path)
  project     = var.project
}
