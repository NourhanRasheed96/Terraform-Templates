variable "access_key" {
        description = "Access key to AWS console"
}
variable "secret_key" {
        description = "Secret key to AWS console"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default = "us-east-1"
}

variable "instance_name" {
        description = "Name of the instance to be created"
        default = "terraform-template-test"
}

variable "instance_type" {
        default = "t2.micro"
}

variable "subnet_id" {
        description = "The VPC subnet the instance(s) will be created in"
        default = "subnet-0f1bc6ff5fc91722e"
}

variable "ami_id" {
        description = "The AMI to use"
        default = "ami-0ff8a91507f77f867"
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 1
}

variable "ami_key_pair_name" {
        default = "MYKEY"
}