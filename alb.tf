resource "aws_lb" "test-lb" {
  name               = "constellation"
  load_balancer_type = "application"
  internal           = false
  subnets            = module.vpc.public_subnets
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
  security_groups = [aws_security_group.lb.id]
}

resource "aws_security_group" "lb" {
  name   = "allow-all-lb"
  vpc_id = data.aws_vpc.main.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_lb_target_group" "lb_target_group" {
  name        = "constellationjs-target-group"
  port        = "8082"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 60
    interval            = 300
    matcher             = "200,301,302"
  }
}

resource "aws_lb_listener" "web-listener" {
  load_balancer_arn = aws_lb.test-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "redirect"
    redirect {
              host        = "#{host}"
              path        = "/#{path}"
              port        = "443"
              protocol    = "HTTPS"
              query       = "#{query}"
              status_code = "HTTP_301"
            }
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}

# Eugene 
resource "aws_lb" "eugenelab-lb" {
  name               = "eugenelab"
  load_balancer_type = "application"
  internal           = false
  subnets            = module.vpc.public_subnets
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
  security_groups = [aws_security_group.lb.id]
}

resource "aws_lb_target_group" "eugenelab_lb_target_group" {
  name        = "eugenelab-target-group"
  port        = "8080"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 60
    interval            = 300
    matcher             = "200,301,302"
  }
}

resource "aws_lb_listener" "eugenelab-secure-listener" {
  load_balancer_arn = aws_lb.eugenelab-lb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "arn:aws:acm:us-east-1:464116869262:certificate/fd4920b6-9ec2-4f99-b203-46696e7251eb"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.eugenelab_lb_target_group.arn
  }
}

resource "aws_lb_listener" "eugenelab-listener" {
  load_balancer_arn = aws_lb.eugenelab-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "redirect"
    redirect {
              host        = "#{host}"
              path        = "/#{path}"
              port        = "443"
              protocol    = "HTTPS"
              query       = "#{query}"
              status_code = "HTTP_301"
            }
    target_group_arn = aws_lb_target_group.eugenelab_lb_target_group.arn
  }
}

# fpselection 
resource "aws_lb" "fpselection-lb" {
  name               = "fpselection"
  load_balancer_type = "application"
  internal           = false
  subnets            = module.vpc.public_subnets
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
  security_groups = [aws_security_group.lb.id]
}

resource "aws_lb_target_group" "fpselection_lb_target_group" {
  name        = "fpselection-target-group"
  port        = "8080"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 60
    interval            = 300
    matcher             = "200,301,302"
  }
}

resource "aws_lb_listener" "fpselection-secure-listener" {
  load_balancer_arn = aws_lb.fpselection-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.fpselection_lb_target_group.arn
  }
}


# parchmint 
resource "aws_lb" "parchmint-lb" {
  name               = "parchmint"
  load_balancer_type = "application"
  internal           = false
  subnets            = module.vpc.public_subnets
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
  security_groups = [aws_security_group.lb.id]
}

resource "aws_lb_target_group" "parchmint_lb_target_group" {
  name        = "parchmint-target-group"
  port        = "8080"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 60
    interval            = 300
    matcher             = "200,301,302"
  }
}

resource "aws_lb_listener" "parchmint-secure-listener" {
  load_balancer_arn = aws_lb.parchmint-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.parchmint_lb_target_group.arn
  }
}


# minieugene 
resource "aws_lb" "minieugene-lb" {
  name               = "minieugene"
  load_balancer_type = "application"
  internal           = false
  subnets            = module.vpc.public_subnets
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
  security_groups = [aws_security_group.lb.id]
}

resource "aws_lb_target_group" "minieugene_lb_target_group" {
  name        = "minieugene-target-group"
  port        = "8080"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 60
    interval            = 300
    matcher             = "200,301,302"
  }
}

resource "aws_lb_listener" "minieugene-secure-listener" {
  load_balancer_arn = aws_lb.minieugene-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.minieugene_lb_target_group.arn
  }
}

# cellov2 
resource "aws_lb" "cellov2-lb" {
  name               = "cellov2"
  load_balancer_type = "application"
  internal           = false
  subnets            = module.vpc.public_subnets
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
  security_groups = [aws_security_group.lb.id]
}

resource "aws_lb_target_group" "cellov2_lb_target_group" {
  name        = "cellov2-target-group"
  port        = "8080"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 60
    interval            = 300
    matcher             = "200,301,302"
  }
}

resource "aws_lb_listener" "cellov2-secure-listener" {
  load_balancer_arn = aws_lb.cellov2-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cellov2_lb_target_group.arn
  }
}

# cellov1 
resource "aws_lb" "cellov1-lb" {
  name               = "cellov1"
  load_balancer_type = "application"
  internal           = false
  subnets            = module.vpc.public_subnets
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
  security_groups = [aws_security_group.lb.id]
}

resource "aws_lb_target_group" "cellov1_lb_target_group" {
  name        = "cellov1-target-group"
  port        = "8080"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 60
    interval            = 300
    matcher             = "200,301,302"
  }
}

resource "aws_lb_listener" "cellov1-secure-listener" {
  load_balancer_arn = aws_lb.cellov1-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cellov1_lb_target_group.arn
  }
}

# clothov4 
resource "aws_lb" "clothov4-lb" {
  name               = "clothov4"
  load_balancer_type = "application"
  internal           = false
  subnets            = module.vpc.public_subnets
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
  security_groups = [aws_security_group.lb.id]
}

resource "aws_lb_target_group" "clothov4_lb_target_group" {
  name        = "clothov4-target-group"
  port        = "9000"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 60
    interval            = 300
    matcher             = "200,301,302"
  }
}

resource "aws_lb_listener" "clothov4-secure-listener" {
  load_balancer_arn = aws_lb.clothov4-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.clothov4_lb_target_group.arn
  }
}

resource "aws_lb_target_group" "clothov4_lb_mongo_shard_target_group" {
  name        = "clothov4-mongo-shard-group"
  port        = "27016"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
}

resource "aws_lb_listener" "clothov4-mongo-shard-listener" {
  load_balancer_arn = aws_lb.clothov4-lb.arn
  port              = "27016"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.clothov4_lb_mongo_shard_target_group.arn
  }
}


resource "aws_lb_target_group" "clothov4_lb_mongo_target_group" {
  name        = "clothov4-mongo-target-group"
  port        = "27017"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
}

resource "aws_lb_listener" "clothov4-mongo-listener" {
  load_balancer_arn = aws_lb.clothov4-lb.arn
  port              = "27017"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.clothov4_lb_mongo_target_group.arn
  }
}

resource "aws_lb_target_group" "clothov4_lb_pm2_target_group" {
  name        = "clothov4-pm2-target-group"
  port        = "8000"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
}

resource "aws_lb_listener" "clothov4-pm2-listener" {
  load_balancer_arn = aws_lb.clothov4-lb.arn
  port              = "8000"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.clothov4_lb_pm2_target_group.arn
  }
}


resource "aws_lb_target_group" "clothov4_lb_smtp_target_group" {
  name        = "clothov4-smtp-target-group"
  port        = "465"
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.main.id
}

resource "aws_lb_listener" "clothov4-smtp-listener" {
  load_balancer_arn = aws_lb.clothov4-lb.arn
  port              = "465"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.clothov4_lb_smtp_target_group.arn
  }
}