# Public Route Table
# Routes traffic from public subnets to the internet gateway
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.sheri-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "sheri-public-rt"
    Type = "Public"
  }
}

# Private Route Table
# Routes traffic from private subnets to the NAT gateway
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.sheri-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "sheri-private-rt"
    Type = "Private"
  }
}



# Route table associations for public subnets
resource "aws_route_table_association" "public-ohio-east2a" {
  subnet_id      = aws_subnet.public-ohio-east2a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-ohio-east2b" {
  subnet_id      = aws_subnet.public-ohio-east2b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-ohio-east2c" {
  subnet_id      = aws_subnet.public-ohio-east2c.id
  route_table_id = aws_route_table.public.id
}

# Route table associations for private subnets
resource "aws_route_table_association" "private-ohio-east2a" {
  subnet_id      = aws_subnet.private-ohio-east2a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-ohio-east2b" {
  subnet_id      = aws_subnet.private-ohio-east2b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-ohio-east2c" {
  subnet_id      = aws_subnet.private-ohio-east2c.id
  route_table_id = aws_route_table.private.id
}