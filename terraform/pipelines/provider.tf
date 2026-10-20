provider "aws" {
  region = var.region
}

provider "random" {}

terraform {
  cloud {
    organization = "ADELL"

    workspaces {
      name = "aws-devsecops-pipelines"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}