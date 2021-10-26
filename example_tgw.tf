# Transit Gateway
resource "aws_ec2_transit_gateway" "valtix_tgw" {
  description = "Valtix Transit Gateway US-West-2"
  auto_accept_shared_attachments = "enable"
  tags = "Name:Valtix-TGW-US-West-2"
}