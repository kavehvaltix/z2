# Valtix Variables
valtix_aws_region				    = "us-west-2"
valtix_aws_azs					    = ["us-west-2a","us-west-2b"]
valtix_aws_firewall_role_arn	    = "arn:aws:iam::843948977550:role/valtix-firewall-role"
valtix_aws_keypair_name			    = "valtix+west"
valtix_account_name				    = "sszuorafrqxeoyx"
valtix_api_key_file				    = "Valtix-Zuora-Terr.json"
valtix_csp_name					    = "aws-843948977550"
valtix_svpc_cidr				    = "172.23.0.0/21"
valtix_svpc_name				    = "valtix_svpc"
valtix_policy_ruleset_eastwest_name = "valtix_policy_ruleset_eastwest"
valtix_gateway_eastwest_name		= "valtix_gateway_eastwest"
valtix_gateway_autoscale_min        = 1
valtix_gateway_autoscale_max        = 1
valtix_gateway_version			    = "2.9-05"

#Workspaces AWS account details
aws_principle_spoke_vpc             = "1111111111"
aws_workspaces_account_vpc_id       = "1111111111"
spoke_vpc_csp_account_name          = "1111111111" 
spoke_route_table_ids               = [""]
transit_vpc_cidr                    = ""