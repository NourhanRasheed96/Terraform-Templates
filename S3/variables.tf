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