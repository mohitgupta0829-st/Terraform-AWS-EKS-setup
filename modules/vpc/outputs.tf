output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "VPC CIDR"
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value = [
    for subnet in values(aws_subnet.public) : subnet.id
  ]
}

output "private_subnet_ids" {
  description = "Private Subnet IDs"
  value = [
    for subnet in values(aws_subnet.private) : subnet.id
  ]
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = var.enable_nat_gateway ? aws_nat_gateway.this[0].id : null
}

output "public_route_table_id" {
  description = "Public Route Table ID"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "Private Route Table ID"
  value       = var.enable_nat_gateway ? aws_route_table.private[0].id : null
}
