
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">=1.0.0"
}

provider "aws" {
  profile = "new-admin"
  region  = "ap-northeast-1"
}
