#### for webserver ####
resource "aws_security_group" "web_server" {
  name = "web_server"
  description = "Allow HTTP and HTTPS traffic"
  vpc_id = aws_vpc.sheri-vpc.id

  tags = {
    Name = "web-server-ingress"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web_server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_SSH" {
  security_group_id = aws_security_group.web_server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


################### SG for ping
resource "aws_security_group" "ping_server" {
  name = "ping_server"
  description = "Allow icmp for ping"
  vpc_id = aws_vpc.czj-vpc.id

  tags = {
    Name = "icmp-for-ping"
  }
}
resource "aws_vpc_security_group_ingress_rule" "icmp" {
  security_group_id = aws_security_group.ping_server.id

  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_vpc_security_group_egress_rule" "egress_for_ping" {
  security_group_id = aws_security_group.ping_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}