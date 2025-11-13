data "aws_ami" "amazon_linux_2025-ami" {
  most_recent = true
  owners = ["amazon"] # Amazon

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_launch_template" "asg_LT01" {
    name_prefix   = "asg_LT01"
    image_id      = data.aws_ami.amazon_linux_2025-ami.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.tg-sq01.id]    
    user_data = filebase64("startup.sh")
    tag_specifications {
        resource_type = "instance"
        tags = {
            Name = "tg-sq01-instance"
        }
    }
    lifecycle {
        create_before_destroy = true
    }
}