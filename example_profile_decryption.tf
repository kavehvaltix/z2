# Decryption Profile
resource "valtix_profile_decryption" "decryption_profile" {
	name				= var.valtix_decryption_name
	certificate_name	= var.valtix_certificate_name
}