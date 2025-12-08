resource "aws_instance" "web_server" {
  ami = "ami-0f5fcdfbd140e4ab7"
  associate_public_ip_address = true
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ping_server.id, aws_security_group.web-server-sg.id]
  subnet_id = aws_subnet.public-ohio-east1a.id
  user_data = file("./scripts/user_data.sh")
}
