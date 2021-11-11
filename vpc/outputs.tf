#VPC output
output "vpc" {
  value = {
    id = aws_vpc.vpc.id
    name = aws_vpc.vpc.tags.Name
  }
}

output "subnet_id" {
value = aws_subnet.private_subnet[0].id
} 

output "route_table_ids" {
  value = aws_route_table.private_route_table.*.id
}
