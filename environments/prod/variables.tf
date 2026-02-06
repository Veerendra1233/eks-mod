variable "prod_vpc_cidr" {
  description = "CIDR range for prod VPC"
  type        = string
  default     = "10.0.10.0/16" # Unique range for Prod
}
