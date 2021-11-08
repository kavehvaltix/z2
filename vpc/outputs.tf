#VPC output
output "vpc" {
  value = {
    id = aws_vpc.vpc.vpc_id
    name = aws_vpc.vpc.tags.Name
  }
}

output "route_table_ids" {
  value = aws_route_table.private_route_table.*.id
}
