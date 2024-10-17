resource "aws_launch_template" "cma_app_lt" {
  name                   = "cma-app-${var.environment}-lt"
  image_id               = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.cma_app_sg.id]
  tags = {
    Name = "cma-app-${var.environment}"
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name                = "cma-app.${var.environment}"
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_group" "cma_app_asg" {
  name                = "cma-app.${var.environment}-asg"
  vpc_zone_identifier = var.subnet
  min_size            = var.autoscaling_min_size
  max_size            = var.autoscaling_min_size
  desired_capacity    = var.autoscaling_desired_capacity
  target_group_arns   = [aws_lb_target_group.cma_app_lb_tg.arn]


  tag {
    key                 = "Name"
    value               = "cma-app.${var.environment}"
    propagate_at_launch = true
  }

  launch_template {
    id      = aws_launch_template.cma_app_lt.id
    version = aws_launch_template.cma_app_lt.latest_version
  }
  health_check_type = "EC2"
}


