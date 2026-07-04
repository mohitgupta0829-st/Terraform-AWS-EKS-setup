data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

locals {
  environment = terraform.workspace

  name = "${var.project_name}-${local.environment}"

  azs = slice(
    data.aws_availability_zones.available.names,
    0,
    var.availability_zone_count
  )

  common_tags = merge(
    var.tags,
    {
      Environment = local.environment
      Project     = var.project_name
      ManagedBy   = "Terraform"
    }
  )
}
