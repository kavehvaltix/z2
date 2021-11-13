# AWS Account, Regions and IAM roles 
valtix_aws_region				    = "us-west-2"
valtix_aws_azs					    = ["us-west-2a","us-west-2b"]
valtix_aws_firewall_role_arn	    = "arn:aws:iam::797433456563:role/valtix-firewall-role"
valtix_aws_keypair_name			    = "kaveh+sedemo+west2"
valtix_account_name				    = "ssvaltixdjwqgvfa"
valtix_api_key_file				    = "Valtix-Zuora-Terr.json"
valtix_csp_name					    = "AWS-Kaveh-SEDEMO"

#Valtix Service VPC Details
valtix_svpc_cidr				    = "10.100.0.0/16"
valtix_svpc_name				    = "valtix-svpc-us-west-2"

#Valtix GW Configuration
valtix_policy_ruleset_eastwest_name = "valtix-us-west-2-EW"
valtix_gateway_eastwest_name		= "valtix-GW-us-west-2"
valtix_gateway_autoscale_min        = 1
valtix_gateway_autoscale_max        = 1
valtix_gateway_version			    = "2.9-05"

#Workspace AWS Account details
aws_principle_spoke_vpc             = "227255491008"
aws_workspaces_account_vpc_id       = "vpc-04e549b141f576fdd"
spoke_vpc_csp_account_name          = "aws-workspaces"
spoke_route_table_ids               = ["rtb-074fb213e5e4bab72"]


#Transit VPC Configuration

spoke_vpcs = {
  transit_vpc = {
    prefix = "transit_vpc_oregon"
    vpc_cidr = "10.110.0.0/16"
    subnet_bits = 8
    aws_provider_alias = "aws-security"
  }
}

spoke_vms = {
  transit_vm = {
    prefix = "transit_vm_oregon"
    aws_provider_alias = "aws-security"
  },
  workspaces_vm = {
    prefix = "workspaces_vm"
    aws_provider_alias = "aws-workspaces"
  }
}

#VM configuration
ec2_ssh_key_name                    = "kam-tf-11-8-21.pub"  
ec2_instance_type                   = "t3a.medium"