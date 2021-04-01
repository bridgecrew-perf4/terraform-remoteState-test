terraform {
  backend "s3" {
    bucket = "remote-state-test-terraform"
    key    = "0.12.20"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "hoge" {
  bucket = "this-is-test-desu"
}

output "hoge" {
  value = aws_s3_bucket.hoge.arn
}