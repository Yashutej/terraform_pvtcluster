output "vpc_id" {
  value       = aws_vpc.this.id
  description = "VPC ID"
}

output "private_subnet_ids" {
  value       = [for s in aws_subnet.private : s.id]
  description = "IDs of private subnets"
}

output "public_subnet_ids" {
  value       = [for s in aws_subnet.public : s.id]
  description = "IDs of public subnets"
}

output "public_route_table_ids" {
  value       = [aws_route_table.public.id]
  description = "Public route table ID(s)"
}

output "private_route_table_ids" {
  value       = [aws_route_table.private.id]
  description = "Private route table ID(s)"
}
