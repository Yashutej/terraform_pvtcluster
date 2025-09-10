output "s3_endpoint_id" {
  value       = try(aws_vpc_endpoint.s3[0].id, null)
  description = "ID of the S3 Gateway Endpoint"
}

output "interface_endpoint_ids" {
  value       = { for k, ep in aws_vpc_endpoint.interface_endpoints : k => ep.id }
  description = "Map of interface endpoint IDs"
}

output "endpoints_sg_id" {
  value       = try(aws_security_group.endpoints_sg[0].id, null)
  description = "Security group ID for interface endpoints"
}
