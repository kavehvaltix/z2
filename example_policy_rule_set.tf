# Policy Ruleset
resource "valtix_policy_rule_set" "policy_ruleset_egress" {
	name							= var.valtix_policy_ruleset_egress_name
	rule {
		name        				= "Instances-to-Internet-TCP-443"
		description 				= ""
		state	 					= "DISABLED"
		type        				= "ForwardProxy"
		source						= valtix_address_object.app_instances.address_id
#		destination 				= valtix_address_object.any.address_id
		service     				= valtix_service_object.https_443.service_id
		action      				= "ALLOW_LOG"
		network_intrusion_profile	= valtix_profile_network_intrusion.ips.profile_id
		dlp_profile					= valtix_profile_dlp.dlp.profile_id
		fqdn_filter_profile			= valtix_profile_fqdn.fqdn.profile_id
		malicious_ip_profile		= valtix_profile_malicious_ip.mips.profile_id
		packet_capture_enabled		= false
    
	}
	rule {
		name        				= "VPCs-to-Internet-TCP-443"
		description 				= ""
		state	 					= "DISABLED"
		type        				= "ForwardProxy"
		source						= valtix_address_object.app_vpcs.address_id
#		destination 				= valtix_address_object.any.address_id
		service     				= valtix_service_object.https_443.service_id
		action      				= "ALLOW_LOG"
		network_intrusion_profile	= valtix_profile_network_intrusion.ips.profile_id
		dlp_profile					= valtix_profile_dlp.dlp.profile_id
		fqdn_filter_profile			= valtix_profile_fqdn.fqdn.profile_id
		malicious_ip_profile		= valtix_profile_malicious_ip.mips.profile_id
		packet_capture_enabled		= false
    
	}
	rule {
		name        				= "VPCs-to-Internet-TCP-ANY"
		description 				= ""
		state	 					= "ENABLED"
		type        				= "Forwarding"
		source						= valtix_address_object.app_vpcs.address_id
#		destination 				= valtix_address_object.any.address_id
		service     				= valtix_service_object.tcp_any.service_id
		action      				= "ALLOW_LOG"
		network_intrusion_profile	= valtix_profile_network_intrusion.ips.profile_id
#		dlp_profile					= valtix_profile_dlp.dlp.profile_id
		fqdn_filter_profile			= valtix_profile_fqdn.fqdn.profile_id
		malicious_ip_profile		= valtix_profile_malicious_ip.mips.profile_id
		packet_capture_enabled		= false
	}
	rule {
		name        				= "VPCs-to-Internet-UDP-ANY"
		description 				= ""
		state	 					= "ENABLED"
		type        				= "Forwarding"
		source						= valtix_address_object.app_vpcs.address_id
#		destination 				= valtix_address_object.any.address_id
		service     				= valtix_service_object.udp_any.service_id
		action      				= "ALLOW_LOG"
		network_intrusion_profile	= valtix_profile_network_intrusion.ips.profile_id
#		dlp_profile					= valtix_profile_dlp.dlp.profile_id
		fqdn_filter_profile			= valtix_profile_fqdn.fqdn.profile_id
		malicious_ip_profile		= valtix_profile_malicious_ip.mips.profile_id
		packet_capture_enabled		= false
	}
	rule {
		name        				= "DENY-LOG-TCP-ANY"
		description 				= ""
		state	 					= "ENABLED"
		type        				= "Forwarding"
#		source						= valtix_address_object.any.address_id
#		destination 				= valtix_address_object.any.address_id
		service     				= valtix_service_object.tcp_any.service_id
		action      				= "DENY"
		packet_capture_enabled		= false
	}
	rule {
		name        				= "DENY-LOG-UDP-ANY"
		description 				= ""
		state	 					= "ENABLED"
		type        				= "Forwarding"
#		source						= valtix_address_object.any.address_id
#		destination 				= valtix_address_object.any.address_id
		service     				= valtix_service_object.udp_any.service_id
		action      				= "DENY"
		packet_capture_enabled		= false
	}
}