# Services VPC
resource "valtix_service_vpc" "valtix_svpc" {
  name               = var.valtix_svpc_name
  csp_account_name   = var.valtix_csp_name
  region             = var.valtix_aws_region
  cidr               = var.valtix_svpc_cidr
  availability_zones = var.valtix_aws_azs
  transit_gateway_id = aws_ec2_transit_gateway.valtix_tgw.id
}

#Adding the spoke workspaces VPC
resource "valtix_spoke_vpc" "valtix_workspaces_spoke" {
  service_vpc_id             = valtix_service_vpc.valtix_svpc.id
  spoke_vpc_id               = var.aws_workspaces_account_vpc_id
  spoke_vpc_csp_account_name = var.spoke_vpc_csp_account_name
  spoke_vpc_region           = var.valtix_aws_region
  depends_on = [
    aws_ram_resource_share.shared_valtix_tgw, aws_ram_resource_association.tgw_sharing,valtix_service_vpc.valtix_svpc
  ]
}

#updating spoke route table
resource "aws_route" "workspaces_route" {
  provider               = aws.aws-workspaces
  count                  = length(var.spoke_route_table_ids)
  route_table_id         = var.spoke_route_table_ids[count.index]
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = aws_ec2_transit_gateway.valtix_tgw.id
  depends_on = [
    time_sleep.wait_for_tgw_sharing, aws_ram_resource_share_accepter.receiver_accept
  ]
}

/**
#Adding Transit VPC to Valtix
resource "valtix_spoke_vpc" "valtix_tansit_vpc_spoke" {
  service_vpc_id             = valtix_service_vpc.valtix_svpc.id
  spoke_vpc_id               = transit_vpc.vpc_id
  spoke_vpc_csp_account_name = var.valtix_csp_name
  spoke_vpc_region           = var.valtix_aws_region
  depends_on = [
    aws_ram_resource_share.shared_valtix_tgw, aws_ram_resource_association.tgw_sharing,valtix_service_vpc.valtix_svpc
  ]
}
**/
/**
#updating Transit VPC route table 
resource "aws_route" "transit_vpc_route" {
  route_table_id         = aws_vpc.vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = aws_ec2_transit_gateway.valtix_tgw.id
  depends_on = [
    time_sleep.wait_for_tgw_sharing
  ]
}
**/