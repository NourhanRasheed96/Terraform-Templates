# Terraform_Templates

The scripts in this repo are Terraform configurations that create an AWS infrastructure using the AWS provider. The infrastructure includes a VPC, two subnets, a security group, an internet gateway, a route table, a task definition, an ECS cluster, an ECS service, an Application Load Balancer, and a target group.

## Pre-Requisites

•	A valid AWS account

•	AWS access key and secret key, which can be obtained from the AWS IAM user

•	Terraform installed on your local machine

## Variables

The following variables need to be set before running the script:

•	__region__: the region where the infrastructure will be created

•	__access_key__: the AWS access key

•	__secret_key__: the AWS secret key

__Make sure to add the access key and the secret key in a .tfvars file before running any of the templates in this repository__


## Usage

1.	Make sure that you have Terraform installed on your machine.
2.	Clone this repository.
3.	In the root of the repository, create a file named terraform.tfvars and set the region, access_key, and secret_key variables to the appropriate values.
4. **Configure AWS Credentials:** Update `terraform.tfvars` with your AWS `access_key` and `secret_key`.
5. **Initialize Terraform:** Run `terraform init` to initialize your Terraform workspace.
6. **Plan Deployment:** Execute `terraform plan` to review the infrastructure changes.
7. **Apply Configuration:** Use `terraform apply` to apply the configuration and create the infrastructure.
8. **Destroy Infrastructure:** When needed, `terraform destroy` can be used to remove all the resources.


