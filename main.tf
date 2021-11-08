# Terraform
terraform {
	required_providers {
		valtix		= {
			source	= "valtix-security/valtix"
			version = "2.10.1"
		}
		aws = {
			source  = "hashicorp/aws"
			version = "~> 3.0"
		}
	}
}

# Providers
provider "valtix" {
	acctname		= var.valtix_account_name
	api_key_file	= file (var.valtix_api_key_file)
}

provider "aws" {
	region					= var.valtix_aws_region
	profile                 = "sedemo-kaveh-lab"
}

# need this to update workspace VPC route table to go to TGW
provider "aws" {
  	alias					= "aws-workspaces"
  	region                  = var.valtix_aws_region
  	profile                 = "aws-workspaces"
}

module "vpc" {
  source        	 = "./vpc"
  prefix        	 = each.value.prefix
  vpc_cidr      	 = each.value.vpc_cidr
  subnet_bits  		 = each.value.subnet_bits
  aws_provider_alias = each.value.aws_provider_alias
  zones              = var.valtix_aws_azs
  key_name      	 = var.ec2_ssh_key_name
  instance_type      = var.ec2_instance_type
}

module "vm" {
  source        	 = "./vm"
  prefix        	 = each.value.prefix
  vpc_cidr      	 = each.value.vpc_cidr
  subnet_bits  		 = each.value.subnet_bits
  aws_provider_alias = each.value.aws_provider_alias
  zones              = var.valtix_aws_azs
  key_name      	 = var.ec2_ssh_key_name
  instance_type      = var.ec2_instance_type
}