# CSP Account
resource "valtix_cloud_account" "aws" {
	name						= var.valtix_workspaces_csp_name
	csp_type					= "AWS"
	aws_credentials_type		= "AWS_IAM_ROLE"
	aws_iam_role				= var.valtix_ws_aws_controller_role_arn
	aws_account_number			= var.valtix_ws_aws_account
	aws_iam_role_external_id	= var.valtix_ws_aws_external_id
	inventory_monitoring {
    	regions					= var.valtix_csp_regions
    	refresh_interval		= 10
	}
}