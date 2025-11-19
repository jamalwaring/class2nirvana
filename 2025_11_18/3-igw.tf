resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.sheri-vpc.id

  tags = {
    Name = "igw"
  }
}