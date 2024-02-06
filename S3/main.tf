provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "random_id" "id" {
    byte_length = 2
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