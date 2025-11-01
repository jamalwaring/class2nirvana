# Elastic IP for NAT Gateway
# NAT gateway needs a static public IP address
resource "aws_eip" "antoinette-nat-eip" {
  domain = "vpc"

  tags = {
    Name = "antoinette-nat-eip"
  }

  depends_on = [aws_internet_gateway.igw]
}

# NAT Gateway
# Allows resources in private subnets to reach the internet
# but prevents the internet from initiating connections to them
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.antoinette-nat-eip.id
  subnet_id     = aws_subnet.public-oregon-west2a.id

  tags = {
    Name = "antoinette-nat-gateway"
  }

  depends_on = [aws_internet_gateway.igw]
}