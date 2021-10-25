# DLP Profile
resource "valtix_profile_dlp" "dlp" {
	name				= var.valtix_dlp_name
	description			= ""
	dlp_filter_list {
		description		= "Keys"
		static_patterns	= ["AWS Access Key","AWS Secret Key","DSA Private Key","GitHub Key","Heroku Key","Putty SSH DSA Key","Putty SSH RSA Key","RSA Private Key","SSH DSS Public Key","SSH RSA Public Key","SSL Certificate"]
		count			= 5
		action			= "DROP"
	}
	dlp_filter_list {
		description		= "Certificates"
		static_patterns	= ["SSL Certificate"]
		count			= 5
		action			= "DROP"
	}
}