resource "aws_autoscaling_policy" "web_tier_cpu_p" {
    name                   = "web_tier_cpu_p"
    autoscaling_group_name = aws_autoscaling_group.web-tier-scaler-gp.name
    policy_type = "TargetTrackingScaling"

    target_tracking_configuration {
        predefined_metric_specification {
            predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 40.0
    }
}