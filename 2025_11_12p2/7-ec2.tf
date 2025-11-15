# resource "aws_instance" "web_server" {
#   ami = "ami-083b3f53cbda7e5a4"
#   associate_public_ip_address = true
#   instance_type = "t3.micro"
#   vpc_security_group_ids = [aws_security_group.ping_server.id, aws_security_group.web_server.id]
#   subnet_id = aws_subnet.public-ohio-east2a.id
#   user_data = file("user_data.sh")
# }
