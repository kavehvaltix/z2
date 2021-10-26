# Transit Gateway

# Services VPC
resource "valtix_service_vpc" "valtix_svpc" {
  name               = var.valtix_svpc_name
  csp_account_name   = var.valtix_csp_name
  region             = var.valtix_svpc_region
  cidr               = var.valtix_svpc_cidr
  availability_zones = var.valtix_aws_azs
  transit_gateway_id = aws_ec2_transit_gateway.valtix_tgw.id
}