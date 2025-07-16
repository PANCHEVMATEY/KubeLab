
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "${var.vpc_name}-nat-eip-${var.env}"
    Env  = var.env
  }
}


resource "aws_nat_gateway" "private_nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_1a.id
  tags = {
    Name = "${var.vpc_name}-natgw-${var.env}"
    Env  = var.env
  }

  depends_on = [aws_internet_gateway.igw]
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}-private-rt-${var.env}"
    Env  = var.env
  }
}

resource "aws_route" "private_natgw" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.private_nat_gw.id
}


resource "aws_route_table_association" "private_assoc_1a" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_assoc_1a" {
  subnet_id      = aws_subnet.private_1b.id
  route_table_id = aws_route_table.private.id
}