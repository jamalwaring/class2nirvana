resource "aws_lb" "web-tier-app-lb" {
    name               = "web-tier-app-lb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.web_lb.id]
    subnets            = [aws_subnet.public-ohio-east1a.id, 
                        aws_subnet.public-ohio-east1b.id, 
                        aws_subnet.public-ohio-east1c.id]

    #important why??!!
    enable_deletion_protection = false

    tags = {
        Name = "web-tier-app-lb"
    }
}