provider "aws" {
  region = var.region
}

terraform {
  cloud {
    organization = "ADELL"

    workspaces {
      name = "dsb-aws-devsecops-eks-cluster-1"
    }
  }
}