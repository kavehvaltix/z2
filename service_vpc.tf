# Services VPC
resource "valtix_service_vpc" "valtix_svpc" {
  name               = var.valtix_svpc_name
  csp_account_name   = var.valtix_csp_name
  region             = var.valtix_svpc_region
  cidr               = var.valtix_svpc_cidr
  availability_zones = var.valtix_aws_azs
  transit_gateway_id = aws_ec2_transit_gateway.valtix_tgw.id
}

#Adding the spoke workspaces VPC
resource "valtix_spoke_vpc" "valtix_workspaces_spoke" {
  service_vpc_id             = valtix_service_vpc.valtix_svpc.id
  spoke_vpc_id               = var.aws_workspaces_account_vpc_id
  spoke_vpc_csp_account_name = var.spoke_vpc_csp_account_name
  spoke_vpc_region           = "us-west-2"
  depends_on = [
    aws_ram_resource_share.shared_valtix_tgw, aws_ram_resource_association.tgw_sharing,valtix_service_vpc.valtix_svpc
  ]
}

#updating spoke route table
resource "aws_route" "route" {
  provider               = aws.aws-workspaces
  count                  = length(var.spoke_route_table_ids)
  route_table_id         = var.spoke_route_table_ids[count.index]
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = var.transit_gateway_id
}
