resource "aws_autoscaling_group" "web-tier-scaler-gp" {
    name               = "web-tier-scaler-gp"
    vpc_zone_identifier = [aws_subnet.private-ohio-east1a.id, 
                            aws_subnet.private-ohio-east1b.id, 
                            aws_subnet.private-ohio-east1c.id]
    #desired_capacity   = 1
    max_size           = 9
    min_size           = 3
    default_cooldown = 60
    default_instance_warmup = 60
    health_check_grace_period = 120
    health_check_type = "ELB"

    force_delete = true

    target_group_arns = [aws_lb_target_group.web-app-lb-tg.arn]

    launch_template {
        id      = aws_launch_template.web_tier.id
        version = "$Latest"
    }

    tag {
      key   = "Name"
      value = "web-app"
      propagate_at_launch = true
    }
}