resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.antoinette-vpc.id

  tags = {
    Name = "igw"
  }
}