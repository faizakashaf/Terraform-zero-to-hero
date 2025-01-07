provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "exa_bucket" {
  bucket = var.s3_bucket

  tags = {
    Name = "My Bucket"
  }
}

resource "aws_s3_object" "example-bucket" {
  bucket = var.s3_bucket
  key = var.s3_key
  source = var.source_of_file

  depends_on = [ aws_s3_bucket.exa_bucket ]
}