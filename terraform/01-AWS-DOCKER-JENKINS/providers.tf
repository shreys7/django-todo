terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.0"
    }
  
  docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">= 1.2.0"
}


provider "aws" {
  shared_config_files = var.shared_config_files
  shared_credentials_files = var.shared_credentials_files
  region = "us-east-1"
}

provider docker{

}

