### Terraform Integrated AWS Infrastructure

This Terraform configuration sets up an AWS infrastructure including a VPC, subnets, security group, internet gateway, route tables, an ECS cluster, task definition, service, an Application Load Balancer (ALB) with target group and listener, a random ID for naming uniqueness, an EC2 instance, Elastic IP (EIP), S3 bucket with a policy, and optionally, key pairs for EC2 instance access.

#### Prerequisites:
- Terraform installed
- AWS CLI configured
- AWS access key and secret key

#### Usage:
1. **Configure AWS Credentials:** Update `terraform.tfvars` with your AWS `access_key` and `secret_key`.
2. **Initialize Terraform:** Run `terraform init` to initialize your Terraform workspace.
3. **Plan Deployment:** Execute `terraform plan` to review the infrastructure changes.
4. **Apply Configuration:** Use `terraform apply` to apply the configuration and create the infrastructure.
5. **Destroy Infrastructure:** When needed, `terraform destroy` can be used to remove all the resources.

#### Variables:
- Modify variables in `variables.tf` according to your requirements, such as AWS region, ECS configurations, instance type, etc.

#### Resources Created:
- **VPC** with CIDR block `10.0.0.0/16`.
- **Two Subnets** across different AZs for high availability.
- **Security Group** for controlling access to the resources.
- **Internet Gateway** and **Route Tables** for internet connectivity.
- **ECS Cluster**, **Task Definition**, and **Service** for container management.
- **Application Load Balancer** (ALB) with **Target Group** and **Listener** for distributing incoming traffic.
- **EC2 Instance** with associated **EIP** for running applications.
- **S3 Bucket** for storage, with a policy for access management.

Ensure your AWS account has the necessary permissions to create these resources. For detailed explanations of each resource and additional configurations, refer to the official [AWS Terraform Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs).
