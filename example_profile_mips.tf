# Malicious IPs Profile
resource "valtix_profile_malicious_ip" "mips" {
	name					= var.valtix_mips_name
	description 			= ""
	ip_reputation_enabled	= true
	auto_update				= true
	delay_by_days			= 0
}