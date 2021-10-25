# VPCs
data "aws_vpc" "vpc1" {
	filter {
		name	= "tag:Name"
		values	= ["app1-vpc-us-east-1"]
	}
}

data "aws_vpc" "vpc2" {
	filter {
		name	= "tag:Name" 
		values	= ["app2-vpc-us-east-1"]
	}
}

# Instances
data "aws_instance" "instance1" {
	filter {
		name	= "tag:Name"
		values	= ["app1-linux-us-east-1"]
	}
}

data "aws_instance" "instance2" {
	filter {
		name	= "tag:Name"
		values	= ["app2-linux-us-east-1"]
	}
}

# Address Objects
resource "valtix_address_object" "app_vpc1" {
	name             	= "app_vpc1"
	description      	= ""
	type             	= "DYNAMIC_VPC"
	csp_account_name 	= valtix_cloud_account.aws.name
	region           	= var.valtix_aws_region
	vpc_id           	= data.aws_vpc.vpc1.id
}

resource "valtix_address_object" "app_vpc2" {
	name             	= "app_vpc2"
	description     	= ""
	type             	= "DYNAMIC_VPC"
	csp_account_name 	= valtix_cloud_account.aws.name
	region           	= var.valtix_aws_region
	vpc_id           	= data.aws_vpc.vpc2.id
}

resource "valtix_address_object" "app_vpcs" {
	name             	= "app_vpcs"
	description      	= ""
	type             	= "GROUP"
	address_group_ids	= [valtix_address_object.app_vpc1.address_id, valtix_address_object.app_vpc2.address_id]
}

resource "valtix_address_object" "app_instance1" {
	name             	= "app_instance1"
	description      	= ""
	type             	= "DYNAMIC_INSTANCE"
	csp_account_name 	= valtix_cloud_account.aws.name
	region           	= var.valtix_aws_region
	vpc_id           	= data.aws_vpc.vpc1.id
	instance_id			= data.aws_instance.instance1.id
}

resource "valtix_address_object" "app_instance2" {
	name             	= "app_instance2"
	description     	= ""
	type             	= "DYNAMIC_INSTANCE"
	csp_account_name 	= valtix_cloud_account.aws.name
	region           	= var.valtix_aws_region
	vpc_id           	= data.aws_vpc.vpc2.id
	instance_id			= data.aws_instance.instance2.id
}

resource "valtix_address_object" "app_instances" {
	name             	= "app_instances"
	description      	= ""
	type             	= "GROUP"
	address_group_ids	= [valtix_address_object.app_instance1.address_id, valtix_address_object.app_instance2.address_id]
}