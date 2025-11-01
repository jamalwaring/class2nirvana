resource "aws_instance" "antoinette-ec2" {
  ami           = "ami-06d455b8b50b0de4d"
  instance_type = "t3.micro"
  user_data     = file("user_data.sh")
  associate_public_ip_address = true
  security_groups = [aws_security_group.antoinette-sg.id]
  subnet_id = aws_subnet.public-oregon-west2a.id

  tags = {
    Name = "antionette-ec2"
  }
}
