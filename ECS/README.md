# AWS ECS Terraform Template

This Terraform template allows you to provision Amazon Elastic Container Service (ECS) resources on AWS. You can create ECS clusters, task definitions, services, and more using this template.

## Prerequisites

Before using this template, ensure that you have the following:

1. [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed on your local machine.

2. AWS account credentials configured on your machine. You can set up AWS CLI credentials using `aws configure`.

## Usage

Follow these steps to use this Terraform template:

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/NourhanRasheed96/Terraform-Templates.git
   ```

2. Navigate to the "AWS-ECS" directory:

   ```bash
   cd Terraform-Templates/AWS-ECS
   ```

3. Initialize Terraform in the directory:

   ```bash
   terraform init
   ```

4. Review and modify the `variables.tf` file to customize your ECS resources (e.g., cluster name, task definitions).

5. Deploy the ECS resources using Terraform:

   ```bash
   terraform apply
   ```

6. Confirm the deployment by typing "yes" when prompted.

7. Once the deployment is complete, Terraform will display information about the created resources, including ECS cluster and service details.

8. To destroy the ECS resources when you're done, use the following command:

   ```bash
   terraform destroy
   ```

   Confirm the destruction by typing "yes" when prompted.

## Variables

You can customize the ECS resources by modifying the variables in the `variables.tf` file. Here are some of the key variables you can set:

- `cluster_name`: The name of the ECS cluster to create.
- `task_definition_family`: The family name for the ECS task definition.
- `desired_count`: The desired number of tasks to run in the ECS service.

## License

This template does not specify a license. Refer to the licensing information in the individual template directories.

Please copy and paste this content into a "README.md" file in the "AWS-ECS" directory of your repository. Customize it further if needed to match your specific ECS template and requirements.
