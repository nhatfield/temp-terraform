resource "aws_lb" "service1" {
  name               = "service1-${var.env_deploy["${var.env}"]}"
  internal           = true
  load_balancer_type = "application"
  security_groups    = var.env_security_groups[var.env]
  subnets            = var.env_lb_prv_subnets[var.env]

}

resource "aws_lb_target_group" "service1" {
  name     = "ecs-service1-${var.env_deploy["${var.env}"]}"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.env_vpcid[var.env]

  health_check {
    path                = "/actuator/health"
    timeout             = "5"
    interval            = "30" 
    healthy_threshold   = "2"
    unhealthy_threshold = "7"
  }

}

resource "aws_lb_listener" "service1-http" {
  load_balancer_arn = "${aws_lb.service1.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.service1.arn}"
  }
}

resource "aws_lb_listener" "service1-http-custom" {
  load_balancer_arn = "${aws_lb.service1.arn}"
  port              = var.env_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.service1.arn}"
  }
}

resource "aws_lb_listener" "service1-https" {
  load_balancer_arn = "${aws_lb.service1.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.cert_arn

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.service1.arn}"
  }
}
