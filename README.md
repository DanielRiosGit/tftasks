# Setup GKE private cluster with Terraform

## Prerequisites

### Install Google Cloud SDK

Installation instructions can be found on the following link

https://cloud.google.com/sdk/docs/install

### Install Terraform CLI

Installation instructions can be found on the following link

https://learn.hashicorp.com/tutorials/terraform/install-cli

## Applying the infrastructure

Change the terraform.tfvars with your account details.

The project_id should be retrieved from your gcp account.

The user_by_email should be the email address of the user to give the dataEditor role in the Big Query dataset

Run terraform init

Run terraform apply