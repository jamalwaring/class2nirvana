# Elastic IP for NAT Gateway
# NAT gateway needs a static public IP address
resource "aws_eip" "sheri-nat-eip" {
  domain = "vpc"

  tags = {
    Name = "sheri-nat-eip"
  }

  depends_on = [aws_internet_gateway.igw]
}

# NAT Gateway
# Allows resources in private subnets to reach the internet
# but prevents the internet from initiating connections to them
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.sheri-nat-eip.id
  subnet_id     = aws_subnet.public-ohio-east2a.id

  tags = {
    Name = "sheri-nat-gateway"
  }

  depends_on = [aws_internet_gateway.igw]
}