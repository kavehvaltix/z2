# Gateway
resource "valtix_gateway" "valtix_gateway_eastwest" {
	name                    = var.valtix_gateway_eastwest_name
	description             = ""
	csp_account_name        = var.valtix_csp_name
	instance_type           = "AWS_M5_2XLARGE"
	gateway_image           = var.valtix_gateway_version
	mode                    = "HUB"
	security_type           = "EGRESS"
	policy_rule_set_id      = valtix_policy_rule_set.policy_ruleset_eastwest.rule_set_id
	ssh_key_pair            = var.valtix_aws_keypair_name
	aws_iam_role_firewall   = var.valtix_aws_firewall_role_arn
	region                  = var.valtix_gateway_region
	vpc_id                  = valtix_service_vpc.valtix_svpc.id
	aws_gateway_lb          = "true"
	min_instances			= var.valtix_gateway_autoscale_min
	max_instances			= var.valtix_gateway_autoscale_max
}