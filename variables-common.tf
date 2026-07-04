variable "aws_region" {
  description = "AWS Region for resources"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
  default     = "terraform-eks"
}

variable "environment" {
  description = "Environment name (test/development)"
  type        = string
  default     = ""
}

variable "availability_zone_count" {
  description = "Number of Availability Zones to use"
  type        = number
  default     = 2

  validation {
    condition     = var.availability_zone_count >= 2
    error_message = "At least 2 Availability Zones are required."
  }
}
