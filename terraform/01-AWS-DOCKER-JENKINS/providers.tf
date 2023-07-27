terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  
  docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">= 1.2.0"
}


provider "aws" {
  shared_config_files = ["/Users/yashtank/.aws/config"]
  shared_credentials_files = ["/Users/yashtank/.aws/credentials"]
  region = "us-east-1"
}

provider docker{

}

