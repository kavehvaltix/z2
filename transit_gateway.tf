# Transit Gateway
resource "aws_ec2_transit_gateway" "valtix_tgw" {
  description = "${var.valtix_svpc_name}.${var.valtix_aws_region}"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  auto_accept_shared_attachments = "enable"
    tags = {
    Name = "${var.valtix_svpc_name}.${var.valtix_aws_region}"
  }
}

resource "aws_ram_resource_share" "shared_valtix_tgw" {
  name                      = "Valtix Shared TGW"
  allow_external_principals = true

  tags = {
    Name = "${var.valtix_svpc_name}.${var.valtix_aws_region}"
  }
    depends_on = [
    aws_ec2_transit_gateway.valtix_tgw
  ]
}

resource "aws_ram_principal_association" "aws_workspaces_account" {
  principal          = var.aws_principle_spoke_vpc
  resource_share_arn = aws_ram_resource_share.shared_valtix_tgw.arn
}

resource "aws_ram_resource_association" "tgw_sharing" {
  resource_arn       = aws_ec2_transit_gateway.valtix_tgw.arn
  resource_share_arn = aws_ram_resource_share.shared_valtix_tgw.arn
}

resource "aws_ram_resource_share_accepter" "receiver_accept" {
  provider =  aws.aws-workspaces
  share_arn = aws_ram_principal_association.aws_workspaces_account.resource_share_arn
}

resource "time_sleep" "wait_for_tgw_sharing" {
  depends_on      = [aws_ram_resource_association.tgw_sharing]
  create_duration = "60s"
}
