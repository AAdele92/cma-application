resource "aws_lb" "cma_app_lb" {
  name               = "cma-app-${var.environment}-lb"
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.cma_app_lb_sg.id]
  subnets            = var.subnet
}

resource "aws_lb_target_group" "cma_app_lb_tg" {
  name        = "cma-app-lb-${var.environment}-tg"
  target_type = "instance"
  port        = 8081
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  health_check {
    protocol            = "TCP"
    port                = 8081
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }

}

#Create port 8081 listener for NLB
resource "aws_lb_listener" "cms_app_lb_listener" {
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cma_app_lb_tg.arn
  }
  load_balancer_arn = aws_lb.cma_app_lb.arn
  port              = 8081
  protocol          = "TCP"
}

resource "aws_lb_listener" "cma_app_lb_listener" {
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cma_app_lb_tg.arn
  }
  load_balancer_arn = aws_lb.cma_app_lb.arn
  port              = 443
  protocol          = "TLS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = aws_acm_certificate.cert.arn
  depends_on        = [aws_lb_target_group.cma_app_lb_tg]
}


resource "aws_lb_listener_certificate" "cma_app_listener_certificate" {
  listener_arn    = aws_lb_listener.cma_app_lb_listener.arn
  certificate_arn = aws_acm_certificate.cert.arn
}