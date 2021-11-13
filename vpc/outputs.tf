#VPC output
output "vpc" {
  value = {
    id = aws_vpc.vpc.id
    name = aws_vpc.vpc.tags.Name
  }
}

output "subnet_id" {
value = aws_subnet.private_subnet.id
} 

output "route_table_id" {
  value = aws_route_table.private_route_table.id
}
