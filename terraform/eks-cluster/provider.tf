provider "aws" {
  region = var.region
}

terraform {
  cloud {
    organization = "ADELL"

    workspaces {
      name = "aws-devsecops-eks-cluster"
    }
  }
}