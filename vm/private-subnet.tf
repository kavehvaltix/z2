resource "aws_subnet" "private_subnet" {
  count             = length(var.zones)
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr, var.subnet_bits, (count.index * 3))
  availability_zone = var.zones[count.index]

  tags = {
    Name   = "${var.prefix}_private_subnet${count.index + 1}_z${count.index + 1}"
    prefix = var.prefix
  }
}

resource "aws_route_table" "private_route_table" {
  count  = length(var.zones)
  vpc_id = var.vpc_id

  route {
    cidr_block = "${data.http.myip.body}/32"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name   = "${var.prefix}_private_subnet${count.index + 1}_rtable_z${count.index + 1}"
    prefix = var.prefix
  }
}

resource "aws_route_table_association" "private_subnet_table_association" {
  count          = length(var.zones)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}
