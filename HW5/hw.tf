provider aws{
    region = var.region
}


resource "aws_vpc" "kaizen" {
  cidr_block = var.vpc_cidr[0].cidr_block
  enable_dns_support =  var.vpc_cidr[0].enable_dns_support
  enable_dns_hostnames = var.vpc_cidr[0].enable_dns_hostnames
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cidr[0].cidr
  map_public_ip_on_launch = true 
  availability_zone = "${var.region}a" #AZ variable included region variable 

  tags = {
    Name = var.subnet_cidr[0].sub_name
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cidr[1].cidr
  map_public_ip_on_launch = true 
  availability_zone = "${var.region}b"
  tags = {
    Name = var.subnet_cidr[1].sub_name
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cidr[2].cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = var.subnet_cidr[2].sub_name
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cidr[3].cidr
  availability_zone = "${var.region}d"

  tags = { 
    Name = var.subnet_cidr[3].sub_name
  }
}

resource "aws_internet_gateway" "homework5_igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = var.IGW
  }
}

resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.homework5_igw.id
  }

  tags = {
    Name = var.pub-rt
  }
}

resource "aws_route_table" "prv-rt" {
  vpc_id = aws_vpc.kaizen.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.homework5_igw.id
  }

  tags = {
    Name = var.prv-rt
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.prv-rt.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.prv-rt.id
}