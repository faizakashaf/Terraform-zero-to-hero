provider "aws" {
  alias  = "ap_southeast_1"
  region = "ap-southeast-1"
}
provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2-creation"
  ami_id = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  bucket ="faiza-demo-s3-bucket"
  providers = {
    aws.s3 = aws.ap_southeast_1
  }
}

output "public_ip" {
  value = module.ec2_instance.public_ip
}