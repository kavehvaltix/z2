# Adding Transit VPC 
resource "aws_vpc" "transit_vpc" {
  cidr_block = var.transit_vpc_cidr

  tags = {
    Name   = "Transit_VPC"
    prefix = var.prefix
  }
}
#Configuting Internet Gateway for the transit VPC
resource "aws_internet_gateway" "transit_vpc_igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name   = "Transit_VPC_IGW"
  }
}

# add tags to the default route table
resource "aws_default_route_table" "transit_vpc_default_rtable" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  tags = {
    Name   = "transit_vpc_default_rtable"
  }
}