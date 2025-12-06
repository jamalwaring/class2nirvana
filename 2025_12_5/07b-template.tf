resource "aws_launch_template" "web_tier" {
    name = "web-tier-launch-template"
    description = "Launch template for web tier instances"

    #image_id      = data.aws_ssm_parameter.al2023.value
    image_id      = "ami-039fc61cc06b9f215"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.web-server-sg.id] 

    tags = {
        Name = "web-tier-service-instance"
        ManagedBy = "Terraform"
    }

    user_data = filebase64("./scripts/user_data.sh")

    tag_specifications {
        resource_type = "instance"

        tags = {
            ManagedBy = "Terraform"
        }
    }
    lifecycle {
        create_before_destroy = true
    }

}

# image id/ami - <the correct ami for your region for al2023>
# instance type = t3.micro
# user data = ./script
# tags = add { ManagedBy = “Terraform”}
# sg id = aws_security_group.web_server_sg.id
