variable "access_key" {
        description = "Access key to AWS console"
}
variable "secret_key" {
        description = "Secret key to AWS console"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default = "eu-central-1"
}

variable "ecs_cluster_name" {
        default = "terraform-template-test"
}

variable "ecs_task_family" {
        default = "example"
}

variable "ecs_task_name" {
        default = "terraform-template-test"
}

variable "ecs_task_image" {
        default = "nginx:latest"
}

variable "ecs_task_cpu" {
        default = 10
}

variable "ecs_task_memory" {
        default = 512
}

variable "ecs_task_essential" {
        default = true
}

variable "ecs_service_name" {
        default = "example"
        }

variable "ecs_service_desired_count" {
        default = 1
}
variable "alb_name" {
        default = "terraform-template-test"
}

variable "alb_target_group_name" {
        default = "terraform-template-test"
}

variable "alb_target_group_port" {
        default = 80
}

variable "alb_target_group_protocol" {
        default = "HTTP"
}

variable "alb_target_group_type" {
        default = "ip"
}

variable "alb_listener_port" {
        default = "80"
}

variable "alb_listener_protocol" {
        default = "HTTP"
}

variable "alb_listener_default_action_type" {
        default = "forward"
}


variable "instance_name" {
        description = "Name of the instance to be created"
        default = "example"
}

variable "instance_type" {
        default = "t2.micro"
}

variable "subnet_id" {
        description = "The VPC subnet the instance(s) will be created in"
        default = "subnet-07775b43151dcb414"
}

variable "ami_id" {
        description = "The AMI to use"
        default = "ami-0c0d3776ef525d5dd"
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 1
}

variable "key_pair_name" {
        default = "EC2KEY"
}

variable "s3_bucket_name" {
        default = "terraform-template-test"
}

variable "s3_bucket_env" {
        default = "dev"
}

variable "s3_bucket_service" {
        default = "s3"
}

variable "s3_bucket_team" {
        default = "devops"
}

variable "s3_bucket_policy_effect" {
        default = "Allow"
}

variable "s3_bucket_policy_service" {
        default = "ec2.amazonaws.com"
}

variable "s3_bucket_policy_action_get" {
        default = "s3:GetObject"
}

variable "s3_bucket_policy_action_put" {
        default = "s3:PutObject"
}