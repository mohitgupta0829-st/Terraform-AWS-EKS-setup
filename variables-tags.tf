variable "tags" {
  description = "Additional tags to apply to all AWS resources"
  type        = map(string)

  default = {
    Owner       = "Mohit"
    Project     = "terraform-aws-eks"
    ManagedBy   = "Terraform"
    Environment = ""
  }
}
