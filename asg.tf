data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami*amazon-ecs-optimized"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon", "self"]
}

resource "aws_security_group" "ec2-sg" {
  name        = "allow-all-ec2"
  description = "allow all"
  vpc_id      = data.aws_vpc.main.id
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
    Name = "mkerimova"
  }
}

resource "aws_launch_configuration" "lc" {
  name          = "test_ecs"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  lifecycle {
    create_before_destroy = true
  }
  iam_instance_profile        = aws_iam_instance_profile.ecs_service_role.name
  key_name                    = var.key_name
  security_groups             = [aws_security_group.ec2-sg.id]
  associate_public_ip_address = true
  user_data                   = <<EOF
#! /bin/bash
sudo apt-get update
sudo echo "ECS_CLUSTER=${var.cluster_name}" >> /etc/ecs/ecs.config
EOF
}

resource "aws_autoscaling_group" "asg" {
  name_prefix                      = "test-asg"
  launch_configuration      = aws_launch_configuration.nona_lc.name
  min_size                  = 0
  max_size                  = 0
  desired_capacity          = 0
  health_check_type         = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier       = module.vpc.public_subnets

  target_group_arns     = [aws_lb_target_group.lb_target_group.arn]
  protect_from_scale_in = true
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "nona_lc" {
  name_prefix   = "nona_ecs"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.small"
  lifecycle {
    create_before_destroy = true
  }
  iam_instance_profile        = aws_iam_instance_profile.ecs_service_role.name
  key_name                    = var.key_name
  security_groups             = [aws_security_group.ec2-sg.id]
  associate_public_ip_address = true
  user_data                   = <<EOF
#! /bin/bash
sudo apt-get update
sudo echo "ECS_CLUSTER=${var.cluster_name}" >> /etc/ecs/ecs.config
sudo yum install -y wget
sudo wget https://bootstrap.pypa.io/pip/3.6/get-pip.py -O ./get-pip.py
python3 get-pip.py
sudo pip3 install botocore
sudo yum install -y amazon-efs-utils
sudo mkdir -p /data/db
sudo mkdir -p /root
sudo mkdir -p /root/resources
sudo mkdir -p /root/cello_results
sudo mount -t efs -o tls,accesspoint=fsap-0260936da5df77892 fs-02cb949ac2d14929e:/ /data/db
sudo mount -t efs -o tls,accesspoint=fsap-07594c8a2608fff96 fs-02cb949ac2d14929e:/ /root
sudo mount -t efs -o tls,accesspoint=fsap-07dbf8f712d763bee fs-07755a29a495cc8ca:/ /root/resources
sudo mount -t efs -o tls,accesspoint=fsap-0988340d8fd1ccaf5 fs-07755a29a495cc8ca:/ /root/cello_results
sudo mount -t efs -o tls,accesspoint=fsap-0764256c9ff5c4390 fs-076aa12fcc92c9066:/ /data
EOF
}

resource "aws_autoscaling_group" "nona_asg" {
  name                      = "nona-asg"
  launch_configuration      = aws_launch_configuration.nona_lc.name
  min_size                  = 2
>>>>>>> Stashed changes
  max_size                  = 4
  desired_capacity          = 3
  health_check_type         = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier       = module.vpc.public_subnets

  target_group_arns     = [aws_lb_target_group.lb_target_group.arn]
  protect_from_scale_in = true
  lifecycle {
    create_before_destroy = true
  }
}