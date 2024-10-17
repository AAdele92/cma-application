resource "aws_security_group" "cma_app_sg" {
  name        = "cma-app-${var.environment}-sg"
  description = "sg to allow access to app"
  vpc_id      = var.vpc_id
  tags = {
    Name = "cma-app-${var.environment}-sg"
  }
}

resource "aws_security_group_rule" "ingress_ssh_rule" {
  type              = "ingress"
  description       = "ssh access"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cma_app_sg.id
}

resource "aws_security_group_rule" "egress_ssh_rule" {
  type              = "egress"
  description       = "ssh access"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cma_app_sg.id
}

resource "aws_security_group_rule" "ingress_http_rule" {
  type              = "ingress"
  description       = "http access"
  from_port         = 8081
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cma_app_sg.id
}

resource "aws_security_group_rule" "ingress_https_rule" {
  type              = "ingress"
  description       = "https access"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cma_app_sg.id
}

#Security group for NLB
resource "aws_security_group" "cma_app_lb_sg" {
  name        = "cma-app-sg-${var.environment}"
  description = "sg to allow access to app"
  vpc_id      = var.vpc_id
  tags = {
    Name = "cma-app-lb-${var.environment}-sg"
  }
}

resource "aws_security_group_rule" "ingress_lb_ssh_rule" {
  type              = "ingress"
  description       = "ssh access"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cma_app_lb_sg.id
}

resource "aws_security_group_rule" "egress_lb_ssh_rule" {
  type              = "egress"
  description       = "ssh access"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cma_app_lb_sg.id
}

resource "aws_security_group_rule" "ingress_lb_http_rule" {
  type              = "ingress"
  description       = "http access"
  from_port         = 8081
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cma_app_lb_sg.id
}

resource "aws_security_group_rule" "ingress_lb_https_rule" {
  type              = "ingress"
  description       = "https access"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cma_app_lb_sg.id
}