resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true
  tags = {
    Name                     = "${var.vpc_name}-public-${var.env}-${var.availability_zone_a}"
    Env                      = var.env
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = var.availability_zone_b
  map_public_ip_on_launch = true
  tags = {
    Name                     = "${var.vpc_name}-public-${var.env}-${var.availability_zone_b}"
    Env                      = var.env
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.availability_zone_a
  tags = {
    Name                              = "${var.vpc_name}-private-${var.env}-${var.availability_zone_a}"
    Env                               = var.env
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = var.availability_zone_b
  tags = {
    Name                              = "${var.vpc_name}-private-${var.env}-${var.availability_zone_b}"
    Env                               = var.env
    "kubernetes.io/role/internal-elb" = 1
  }
}
