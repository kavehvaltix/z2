resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, var.subnet_bits,0)
  availability_zone = var.zone 

  tags = {
    Name   = "${var.prefix}_private_subnet"
    prefix = var.prefix
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "${data.http.myip.body}/32"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name   = "${var.prefix}_private_subnet"
    prefix = var.prefix
  }
}

resource "aws_route_table_association" "private_subnet_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}
