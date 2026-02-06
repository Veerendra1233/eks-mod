# 1. Configure the Provider
provider "aws" {
  region = "us-east-1"
}

# 2. Call the VPC Module
module "dev_vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = var.dev_vpc_cidr
}

# 3. Call the EKS Module
module "dev_eks" {
  source           = "../../modules/eks"
  cluster_name     = "dev-eks-cluster"
  vpc_id           = module.dev_vpc.vpc_id
  subnet_ids       = module.dev_vpc.private_subnet_ids
  instance_type    = "t3.medium" # Sized for Dev
  desired_capacity = 2
}

# 4. Dev-specific Security Group (For your Application)
resource "aws_security_group" "dev_app_sg" {
  name        = "dev-app-sg"
  description = "Allow port 80 for Dev App"
  vpc_id      = module.dev_vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
