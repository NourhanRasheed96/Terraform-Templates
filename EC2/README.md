# AWS EC2 Terraform Template

This Terraform template allows you to provision Amazon Elastic Compute Cloud (Amazon EC2) instances on AWS. You can customize the instance type, AMI, and other settings as needed.

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

2. Navigate to the "AWS-EC2" directory:

   ```bash
   cd Terraform-Templates/AWS-EC2
   ```

3. Initialize Terraform in the directory:

   ```bash
   terraform init
   ```

4. Review and modify the `variables.tf` file to customize your EC2 instance settings (e.g., instance type, AMI).

5. Deploy the EC2 instance using Terraform:

   ```bash
   terraform apply
   ```

6. Confirm the deployment by typing "yes" when prompted.

7. Once the deployment is complete, Terraform will display information about the created resources.

8. To destroy the EC2 instance and associated resources when you're done, use the following command:

   ```bash
   terraform destroy
   ```

   Confirm the destruction by typing "yes" when prompted.

## Variables

You can customize the EC2 instance by modifying the variables in the `variables.tf` file. Here are some of the key variables you can set:

- `ami_id`: The Amazon Machine Image (AMI) ID to use for the EC2 instance.
- `instance_type`: The EC2 instance type (e.g., t2.micro).
- `subnet_id`: The ID of the subnet where the EC2 instance will be launched.

## Contributing

Contributions to this repository are welcome. If you have improvements or additional features to suggest, please submit a pull request.

## License

This template does not specify a license. Refer to the licensing information in the individual template directories.

For any questions or issues, feel free to open an issue in the repository.
