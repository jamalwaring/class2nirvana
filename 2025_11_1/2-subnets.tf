# Public Subnets
# These subnets have direct internet access via the internet gateway

resource "aws_subnet" "public-oregon-west2a" {
  vpc_id                  = aws_vpc.antoinette-vpc.id
  cidr_block              = "10.25.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "demo-public-subnet-1"
    Type = "Public"
  }
}

resource "aws_subnet" "public-oregon-west2b" {
  vpc_id                  = aws_vpc.antoinette-vpc.id
  cidr_block              = "10.25.2.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "demo-public-subnet-2"
    Type = "Public"
  }
}

resource "aws_subnet" "public-oregon-west2c" {
  vpc_id                  = aws_vpc.antoinette-vpc.id
  cidr_block              = "10.25.3.0/24"
  availability_zone       = "us-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "demo-public-subnet-3"
    Type = "Public"
  }
}

# Private Subnets
# These subnets do not have direct internet access
# They can reach the internet through the NAT gateway

resource "aws_subnet" "private-oregon-west2a" {
  vpc_id            = aws_vpc.antoinette-vpc.id
  cidr_block        = "10.25.11.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "demo-private-subnet-1"
    Type = "Private"
  }
}

resource "aws_subnet" "private-oregon-west2b" {
  vpc_id            = aws_vpc.antoinette-vpc.id
  cidr_block        = "10.25.12.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "demo-private-subnet-2"
    Type = "Private"
  }
}

resource "aws_subnet" "private-oregon-west2c" {
  vpc_id            = aws_vpc.antoinette-vpc.id
  cidr_block        = "10.25.13.0/24"
  availability_zone = "us-west-2c"

  tags = {
    Name = "demo-private-subnet-3"
    Type = "Private"
  }
}