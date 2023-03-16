variable "region" {
  description = "AWS region"
 type = string
 default = lookup(var.kube, "zone")
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}