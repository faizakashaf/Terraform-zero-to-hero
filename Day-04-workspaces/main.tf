provider "aws" {
  region = "us-east-1"
}
variable "s3_bucket" {
  description = "Name of the S3 bucket"
  type        = map(string)

  default = {
    "dev" = "faiza-demo-bucket"
    "stage" = "faiza-demo-bucket-2"
    "prod" = "faiza-demo-bucket-3"
  }

}

variable "s3_key" {
  description = "Key for the object in the bucket"
  type        = map(string)

  default = {
    "dev" = "faiza/faiza.txt"
    "stage" = "kashaf/kash.txt"
    "prod" = "f-folder/foo.txt"

  }

}

variable "source_of_file" {
  description = "Path to the file to be uploaded"
  type        = string
  default = "./modules/s3-bucket-creation/hello.txt"
}

# module "s3-bucket" {
#   source = "./modules/s3-bucket-creation"
#   s3_bucket  = "faiza-terraform-demo-bucket"
#   s3_key = "faiza-folder/faiza.txt"
#   source_of_file = "./modules/s3-bucket-creation/hello.txt"
# }

module "s3-bucket" {
  source = "./modules/s3-bucket-creation"
  s3_bucket  = lookup(var.s3_bucket, terraform.workspace, "kashaf-demo-bucket")
  s3_key = lookup(var.s3_key,terraform.workspace,"dev")
  source_of_file = var.source_of_file
}

# output "bucket_id" {
# value = aws_s3_object.example-bucket.key
# }