# Service Objects
resource "valtix_service_object" "https_443" {
	name           			= "https_443"
	description    			= ""
	service_type   			= "ForwardProxy"
	transport_mode 			= "HTTPS"
	port {
		destination_ports	= "443"
	}
	tls_profile         = valtix_profile_decryption.decryption_profile.profile_id
}

resource "valtix_service_object" "tcp_any" {
  name                = "tcp_any"
  description         = ""
  service_type   			= "Forwarding"
  port {
    destination_ports = "1-65535"
  }
  protocol            = "TCP"
  source_nat          = true
}

resource "valtix_service_object" "udp_any" {
  name                = "udp_any"
  description         = ""
  service_type        = "Forwarding"
  port {
    destination_ports = "1-65535"
  }
  protocol            = "UDP"
  source_nat          = true
}