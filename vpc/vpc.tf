# Creating the VPC 
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name   = "${var.prefix}_vpc"
    prefix = var.prefix
  }
}
#Configuting Internet Gateway for the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name   = "${var.prefix}_igw"
    prefix = var.prefix
  }
}

# add tags to the default route table
resource "aws_default_route_table" "transit_vpc_default_rtable" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  tags = {
    Name   = "${var.prefix}_default_rtable"
    prefix = var.prefix
  }
}