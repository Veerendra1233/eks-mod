variable "dev_vpc_cidr" {
  description = "CIDR range for Dev VPC"
  type        = string
  default     = "10.10.0.0/16" # Unique range for Dev
}
