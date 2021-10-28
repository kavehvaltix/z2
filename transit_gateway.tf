# Transit Gateway
resource "aws_ec2_transit_gateway" "valtix_tgw" {
  description = "Valtix Transit Gateway US-West-2"
  auto_accept_shared_attachments = "enable"
    tags = {
    Name = "Valtix-TGW-US-West-2"
  }
}
resource "aws_ram_resource_share" "shared_valtix_tgw" {
  name                      = "Valtix Shared TGW"
  allow_external_principals = true

  tags = {
    Name = "Valtix-TGW-US-West-2"
  }
}

resource "aws_ram_principal_association" "aws_workspaces_account" {
  principal          = var.aws_principle_spoke_vpc
  resource_share_arn = aws_ram_resource_share.shared_valtix_tgw.arn
}

resource "aws_ram_resource_association" "tgw_sharing" {
  resource_arn       = aws_ec2_transit_gateway.valtix_tgw.arn
  resource_share_arn = aws_ram_resource_share.shared_valtix_tgw.arn
}
