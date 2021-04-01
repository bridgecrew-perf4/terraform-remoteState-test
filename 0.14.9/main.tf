terraform {
  backend "s3" {
    bucket = "remote-state-test-terraform"
    key    = "0.14.9"
    region = "us-east-1"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "hoge" {
  backend = "s3"

  config = {
    bucket = "remote-state-test-terraform"
    key    = "0.12.20"
    region = "us-east-1"
  }
}

resource "aws_ssm_parameter" "region" {
  name  = "/test/s3Name"
  type  = "String"
  value = data.terraform_remote_state.hoge.outputs.hoge
}