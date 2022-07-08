resource "aws_ecs_cluster" "web-cluster" {
  name               = var.cluster_name
  capacity_providers = [aws_ecs_capacity_provider.test.name]
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecs_capacity_provider" "test" {
  name = "capacity-provider-test"
  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.nona_asg.arn
    managed_termination_protection = "ENABLED"

    managed_scaling {
      status          = "ENABLED"
      target_capacity = 85
    }
  }
}


# Containers and definitions

# update file container-def, so it's pulling image from ecr
resource "aws_ecs_task_definition" "task-definition-test" {
  family                = "web-family"
  container_definitions = file("container-definitions/container-def.json")
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecs_service" "service" {
  name            = "web-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-test.arn
  desired_count   = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = "${aws_lb_target_group.lb_target_group.arn}"
    container_name   = "constellationjs-container"
    container_port   = 8082
  }

  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_listener.web-listener]
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "/ecs/frontend-container"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}


# Eugene
resource "aws_ecs_task_definition" "task-definition-eugenelab" {
  family                = "eugenelab"
  container_definitions = file("container-definitions/eugenelab-def.json")
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecs_service" "eugenelab_service" {
  name            = "eugenelab-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-eugenelab.arn
  desired_count   = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = "${aws_lb_target_group.eugenelab_lb_target_group.arn}"
    container_name   = "eugenelab-container"
    container_port   = 8080
  }
  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_listener.eugenelab-listener, aws_lb_listener.eugenelab-secure-listener]
}

resource "aws_cloudwatch_log_group" "eugenelab_log_group" {
  name = "/ecs/eugenelab-container"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

# fpselection
resource "aws_ecs_task_definition" "task-definition-fpselection" {
  family                = "fpselection"
  container_definitions = file("container-definitions/fpselection-def.json")
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecs_service" "fpselection_service" {
  name            = "fpselection-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-fpselection.arn
  desired_count   = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = "${aws_lb_target_group.fpselection_lb_target_group.arn}"
    container_name   = "fpselection-container"
    container_port   = 8080
  }
  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_listener.fpselection-secure-listener]
}

resource "aws_cloudwatch_log_group" "fpselection_log_group" {
  name = "/ecs/fpselection-container"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

# parchmint
resource "aws_ecs_task_definition" "task-definition-parchmint" {
  family                = "parchmint"
  container_definitions = file("container-definitions/parchmint-def.json")
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecs_service" "parchmint_service" {
  name            = "parchmint-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-parchmint.arn
  desired_count   = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = "${aws_lb_target_group.parchmint_lb_target_group.arn}"
    container_name   = "parchmint-container"
    container_port   = 8080
  }
  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_listener.parchmint-secure-listener]
}

resource "aws_cloudwatch_log_group" "parchmint_log_group" {
  name = "/ecs/parchmint-container"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}


# minieugene
resource "aws_ecs_task_definition" "task-definition-minieugene" {
  family                = "minieugene"
  container_definitions = file("container-definitions/minieugene-def.json")
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecs_service" "minieugene_service" {
  name            = "minieugene-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-minieugene.arn
  desired_count   = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = "${aws_lb_target_group.minieugene_lb_target_group.arn}"
    container_name   = "minieugene-container"
    container_port   = 8080
  }
  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_listener.minieugene-secure-listener]
}

resource "aws_cloudwatch_log_group" "minieugene_log_group" {
  name = "/ecs/minieugene-container"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

# cellov1
resource "aws_ecs_task_definition" "task-definition-cellov1" {
  family                = "cellov1"
  container_definitions = file("container-definitions/cellov1-def.json")
  volume {
    name      = "cellov1-storage"
    efs_volume_configuration {
      file_system_id = aws_efs_file_system.cellov1_storage.id
      root_directory = "/"
    }
  }
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecs_service" "cellov1_service" {
  name            = "cellov1-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-cellov1.arn
  desired_count   = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = "${aws_lb_target_group.cellov1_lb_target_group.arn}"
    container_name   = "cellov1-container"
    container_port   = 8080
  }
  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_listener.cellov1-secure-listener]
}

resource "aws_cloudwatch_log_group" "cellov1_log_group" {
  name = "/ecs/cellov1-container"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

# cellov2
resource "aws_ecs_task_definition" "task-definition-cellov2" {
  family                = "cellov2"
  container_definitions = file("container-definitions/cellov2-def.json")
  volume {
    name      = "cellov2-storage"
    efs_volume_configuration {
      file_system_id = aws_efs_file_system.cellov2_storage.id
      root_directory = "/"
    }
  }
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecs_service" "cellov2_service" {
  name            = "cellov2-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-cellov2.arn
  desired_count   = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = "${aws_lb_target_group.cellov2_lb_target_group.arn}"
    container_name   = "cellov2-container"
    container_port   = 8080
  }
  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_listener.cellov2-secure-listener]
}

resource "aws_cloudwatch_log_group" "cellov2_log_group" {
  name = "/ecs/cellov2-container"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

# clothov4
resource "aws_ecs_task_definition" "task-definition-clothov4" {
  family                = "clothov4"
  container_definitions = file("container-definitions/clothov4-def.json")
  volume {
    name      = "clothov4-storage"
    efs_volume_configuration {
      file_system_id = aws_efs_file_system.clothov4_storage.id
      root_directory = "/"
    }
  }
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecs_service" "clothov4_service" {
  name            = "clothov4-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-clothov4.arn
  desired_count   = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = "${aws_lb_target_group.clothov4_lb_target_group.arn}"
    container_name   = "clothov4-container"
    container_port   = 9000
  }
  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_listener.clothov4-secure-listener]
}

resource "aws_cloudwatch_log_group" "clothov4_log_group" {
  name = "/ecs/clothov4-container"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

# knox
resource "aws_ecs_task_definition" "task-definition-knox" {
  family                = "knox"
  container_definitions = file("container-definitions/knox-def.json")
  volume {
    name      = "knox-storage"
    efs_volume_configuration {
      file_system_id = aws_efs_file_system.knox_storage.id
      root_directory = "/"
    }
  }
  network_mode          = "bridge"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecs_service" "knox_service" {
  name            = "knox-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-knox.arn
  desired_count   = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = "${aws_lb_target_group.knox_lb_target_group.arn}"
    container_name   = "knox-container"
    container_port   = 8080
  }
  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_listener.knox-secure-listener]
}

resource "aws_cloudwatch_log_group" "knox_log_group" {
  name = "/ecs/knox-container"
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

