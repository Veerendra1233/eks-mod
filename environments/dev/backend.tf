terraform {
  backend "s3" {
    # This bucket must be created manually once or via a separate script
    bucket         = "my-company-terraform-state" 
    
    # Unique path for the Dev environment
    key            = "dev/eks-cluster/terraform.tfstate" 
    
    region         = "us-east-1"
    
    # Used for state locking to prevent concurrent changes
    dynamodb_table = "terraform-lock-table" 
    
    # Ensures the state file is encrypted at rest
    encrypt        = true 
  }
}                                                                                                                                                                          
