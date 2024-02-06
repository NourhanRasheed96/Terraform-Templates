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
  availability_zone       = "${var.region}a"
}

resource "aws_subnet" "example2" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "${var.region}b"
}

resource "aws_security_group" "example" {
  name        = "example"
  description = "Example security group"
  vpc_id      = aws_vpc.example.id
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id
}

resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.example1.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route" "example" {
  route_table_id = aws_route_table.example.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.example.id
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

resource "random_id" "id" {
    byte_length = 2
}

#
#resource "aws_key_pair" "EC2KEY" {
#key_name = "EC2KEY"
#public_key = tls_private_key.rsa.public_key_openssh
#}

#resource "tls_private_key" "rsa" {
#algorithm = "RSA"
#rsa_bits  = 4096
#}

#resource "local_file" "EC2KEY" {
#content  = tls_private_key.rsa.private_key_pem
#filename = "EC2KEY"
#}
#

resource "aws_instance" "example" {
  ami = "${var.ami_id}"
//  count = "${var.number_of_instances}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_pair_name}"
  subnet_id = aws_subnet.example1.id
  tags = {
    Name = "${var.instance_name}-${random_id.id.dec}"
  }
}

resource "aws_eip" "example" {
  vpc = true
  instance = aws_instance.example.id
}

resource "aws_eip_association" "example" {
  instance_id = aws_instance.example.id
  allocation_id = aws_eip.example.id
}

resource "aws_s3_bucket" "devops_bucket"{
    bucket = "${var.s3_bucket_name}-${random_id.id.dec}"

      tags = {
      Env = "${var.s3_bucket_env}"
      Service = "${var.s3_bucket_service}"
      Team = "${var.s3_bucket_team}"
      }
}

resource "aws_s3_bucket_policy" "devops_bucket" {
  bucket = aws_s3_bucket.devops_bucket.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "${var.s3_bucket_policy_effect}",
      "Principal": {
        "Service": "${var.s3_bucket_policy_service}"
      },
      "Action": [
        "${var.s3_bucket_policy_action_get}",
        "${var.s3_bucket_policy_action_put}"
      ],
      "Resource": "${aws_s3_bucket.devops_bucket.arn}/*"
    }
  ]
}
EOF
}