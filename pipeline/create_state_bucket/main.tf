terraform {
  required_version = ">= 0.12"
}


provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "my-tf-state-bucket-prasad"
  force_destroy = true

  tags = {
    Name        = "My bucket"
    Environment = var.env_name
  }
}

resource "aws_s3_bucket_acl" "terraform_state_acl" {
  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}
