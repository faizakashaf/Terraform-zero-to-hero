terraform {
  backend "s3" {
    bucket         = "faiza-demo-s3-bucket" 
    key            = "faiza/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}