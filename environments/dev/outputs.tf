output "vpc_id" {
  description = "The ID of the Dev VPC"
  value       = module.dev_vpc.vpc_id
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS API"
  value       = module.dev_eks.cluster_endpoint
}

output "dev_app_sg_id" {
  description = "The Security Group ID for the application"
  value       = aws_security_group.dev_app_sg.id
}
