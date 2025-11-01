resource "aws_security_group" "antoinette-sg" {
  name        = "antoinette-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.antoinette-vpc.id

  tags = {
    Name = "antoinette-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "antoinette-sg-SSH" {
  description       = "SSH from anywhere"
  security_group_id = aws_security_group.antoinette-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

    tags = {
        Name = "SSH"
    }
}

resource "aws_vpc_security_group_ingress_rule" "antoinette-sg-HTTP" {
  description       = "SSH from anywhere"
  security_group_id = aws_security_group.antoinette-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

    tags = {
        Name = "HTTP"
    }
}
resource "aws_vpc_security_group_egress_rule" "antoinette-sg-egress-allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.antoinette-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
