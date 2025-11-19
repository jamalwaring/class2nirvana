resource "aws_lb_target_group" "web-app-lb-tg" {
    name     = "web-app-lb-tg"
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.sheri-vpc.id

    tags = {
        Name = "web-app-lb-tg"
    }

    health_check {
        enabled = true
        timeout             = 5
        healthy_threshold  = 2
        unhealthy_threshold = 2
    }
}