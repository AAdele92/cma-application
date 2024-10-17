terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
  backend "s3" {
    bucket = "cmadele-app-bucket"
    region = "eu-west-2"
    key    = "cmadele-app/dev/terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-west-2"
  default_tags {
    tags = {
      BillingID = "Lamtech Account"
      Project   = "CMA Application"
    }
  }
}