resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.czj-vpc.id

  tags = {
    Name = "igw"
  }
}