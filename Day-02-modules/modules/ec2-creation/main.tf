provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "ap_southeast_1"
  region = "ap-southeast-1"
}


resource "aws_instance" "ec2_instance" {
  count = 3
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Server ${count.index}"
  }
  
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket
  provider = aws.s3
  tags = {
    Name        = "My bucket"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  provider = aws.ap_southeast_1
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}