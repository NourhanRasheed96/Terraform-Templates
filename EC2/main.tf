provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-east-1"
}

resource "random_id" "id" {
    byte_length = 2
}

resource "aws_instance" "example" {
  ami = "${var.ami_id}"
  count = "${var.number_of_instances}"
  instance_type = "${var.instance_type}"
  key_name = "${var.ami_key_pair_name}"
  subnet_id = "${var.subnet_id}"
  tags = {
    Name = "${var.instance_name}-${random_id.id.dec}"
  }
}