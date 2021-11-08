output "vm" {
  value = [
    for instance in aws_instance.vm_priv :
    {
      public_ip  = instance.public_ip
      private_ip = instance.private_ip
      az         = instance.availability_zone
      ssh_cmd    = "ssh ubuntu@${instance.public_ip}"
    }
  ]
}


output "vpc" {
  value = {
    id = aws_vpc.transit_vpc.vpc_id
    name = aws_vpc.transit_vpc.tags.Name
  }
}

output "route_table_ids" {
  value = aws_route_table.private_route_table.*.id
}
