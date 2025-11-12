# -------------------------------
# Provider Configuration
# -------------------------------
provider "aws" {
  region = "ap-south-1"
}

# -------------------------------
# VPC Module
# -------------------------------
module "vpc" {
  source              = "./modules/VPC"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  az                  = "ap-south-1a"
  env                 = terraform.workspace
}

# -------------------------------
# EC2 Module
# -------------------------------
module "ec2" {
  source        = "./modules/EC2"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.subnet_id
  key_name      = "keypair"  # 👈 Replace with your real AWS Key Pair name
  env           = terraform.workspace
}

# -------------------------------
# Outputs
# -------------------------------
output "instance_id" {
  value = module.ec2.instance_id
}
