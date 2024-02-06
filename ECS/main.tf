provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}


resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-template-test-vpc"
  }
}

resource "aws_subnet" "example1" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
}

resource "aws_subnet" "example2" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
}

resource "aws_security_group" "example" {
  name        = "example"
  description = "Example security group"
  vpc_id      = aws_vpc.example.id
}

resource "aws_ecs_cluster" "example" {
  name = "${var.ecs_cluster_name}"
}

resource "aws_ecs_task_definition" "example" {
  family = "${var.ecs_task_family}"
  container_definitions = <<EOF
[
    {
        "name": "${var.ecs_task_name}",
        "image": "${var.ecs_task_image}",
        "cpu": ${var.ecs_task_cpu},
       
        "memory": ${var.ecs_task_memory},
        "essential": ${var.ecs_task_essential}
    }
]
EOF
}

resource "aws_ecs_service" "example" {
  name            = "${var.ecs_service_name}"
  task_definition = aws_ecs_task_definition.example.arn
  cluster         = aws_ecs_cluster.example.arn
  desired_count   = 1
}

resource "aws_alb" "example" {
  name            = "${var.alb_name}"
  internal        = true
  security_groups = [aws_security_group.example.id]
  subnets         = [aws_subnet.example1.id, aws_subnet.example2.id]
}


resource "aws_alb_target_group" "example" {
  name                = "${var.alb_target_group_name}"
  port                = "${var.alb_target_group_port}"
  protocol            = "${var.alb_target_group_protocol}"
  target_type         = "${var.alb_target_group_type}"
  vpc_id              = aws_vpc.example.id
}

resource "aws_alb_listener" "example" {
  load_balancer_arn = aws_alb.example.arn
  port              = "${var.alb_target_group_port}"
  protocol          = "${var.alb_listener_protocol}"

  default_action {
    target_group_arn = aws_alb_target_group.example.arn
    type             = "${var.alb_listener_default_action_type}"
  }
}

#Please note this script is an example, it will not work if you use it as it is. You need to adjust it to your requirements and also provide the required credentials in order to run it.

#This script creates an ECS cluster, a task definition, and a service, and also creates a VPC, subnet, security group, ALB and target group, ALB listener. It also defines the nginx container as an example.

#It's important to notice that this script does not create any Auto Scaling Group and Launch Configuration, You can add them to the script if you want to automatically scale your ECS instances.
#Also, you can add any other resources as per your requirement.