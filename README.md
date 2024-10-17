# cma-terraform-application

**Repository**: `git clone git@gitlab.com:cma-lamtech/terraform/cma-terraform-application.git`

**Description**:Provisioning an AWS Autoscalling group and Launch Template to deploy CMA application.

**Prerequisites**:
- Terraform version: ~>1.3.3
- AWS Provider: ~>4.0.0

**Usage**:

- Run `terraform init` to initialize the project - default tfstate file is 'dev' in provider.
- Run `terraform init -reconfigure -backend-config bucket="cma-app-bucket" -backend-config key="cma-app/qa/terraform.tfstate"` to provision another tfstate.file for a new environment within the S3 bucket.
- Run `terraform plan  -out=plan.out --var-file=dev-environment.tfvars` to plan out the project for dev environment.
- Run `terraform apply plan.out` to create the resources for dev environment.

NB: Above code should be modified according to each environment you're working on

**Variables**: 
- region: AWS region (required)
- key_name
- vpc_id
- ami
- subnets

**Outputs**:
- public_ip: Public IP address of the created Lauch Template
- Route53: DNS of the created Lauch Template