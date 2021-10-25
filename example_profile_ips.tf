# IDS/IPS Profile
resource "valtix_profile_network_intrusion" "ips" {
	name			= var.valtix_ips_name
	description		= ""
	auto_update		= true
	delay_by_days	= 0
	policy			= "BALANCED"
}