terraform {
	required_providers {
	  aws = {
		  source = "hashicorp/aws"
		  version = "~> 4.0.0"
	  }
	}
}

// Configure Provider
provider "aws" {
	region = "ap-northeast-2"
}