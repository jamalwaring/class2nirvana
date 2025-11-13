#### for webserver ####
resource "aws_security_group" "tg-sq01" {
  name = "tg-sq01"
  description = "Allow HTTP and HTTPS traffic"
  vpc_id = aws_vpc.sheri-vpc.id

  tags = {
    Name = "web-server-ingress"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tg_http" {
  security_group_id = aws_security_group.tg-sq01.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.tg-sq01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_security_group" "alb-01-sq01" {
  name = "alb-01-sg01"
  description = "Web load balancer security group"
  vpc_id = aws_vpc.sheri-vpc.id

  tags = {
    Name = "sheri load balancing"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_alb_01_http" {
  security_group_id = aws_security_group.alb-01-sq01.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_alb_01_traffic_ipv4" {
  security_group_id = aws_security_group.alb-01-sq01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
