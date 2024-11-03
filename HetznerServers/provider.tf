terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 0.13"

  # S3 bucket
  backend "s3" {
    bucket         = "virtual-sports"
    key            = "terraform/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
  }
}

#Configure the Hetzner provider
provider "hcloud" {
  token = var.hcloud_token
}

# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-1"
  profile = "denismr"
}