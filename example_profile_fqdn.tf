# FQDN Filtering Profile
resource "valtix_profile_fqdn" "fqdn" {
	name						= var.valtix_fqdn_name
	description					= ""
	fqdn_filter_list {
		fqdn_list				= ["Abortion","Abuse Drugs","Adult and Pornography","Alcohol and Tobacco","Auctions","Bot Nets","Business and Economy","Cheating"]
		policy					= "DENY"
		decryption_exception	= false
	}
	fqdn_filter_list {
		fqdn_list				= ["Computer and Internet Info","Computer and Internet Security","Confirmed SPAM Sources","Content Delivery Networks","Cult and Occult","Dating","Dead Sites","Dynamically Generated Content"]
		policy					= "DENY"
		decryption_exception	= false
	}
	fqdn_filter_list {
		fqdn_list				= ["Educational Institutions","Entertainment and Arts","Fashion and Beauty","Financial Services","Gambling","Games","Government","Gross"]
		policy					= "DENY"
		decryption_exception	= false
	}
	fqdn_filter_list {
		fqdn_list				= ["Hacking","Hate and Racism","Health and Medicine","Home and Garden","Hunting and Fishing","Illegal","Image and Video Search","Individual Stock Advice and Tools"]
		policy					= "DENY"
		decryption_exception	= false
	}
	fqdn_filter_list {
		fqdn_list				= ["Internet Communications","Internet Portals","Job Search","Keyloggers and Monitoring","Kids","Legal","Local Information","Malware Sites"]
		policy					= "DENY"
		decryption_exception	= false
	}
	fqdn_filter_list {
		fqdn_list				= ["Marijuana","Military","Motor Vehicles","Music","News and Media","Nudity","Online Greeting Cards","Open Http Proxies"]
		policy					= "DENY"
		decryption_exception	= false
	}
	fqdn_filter_list {
		fqdn_list				= ["Parked Domains","Pay to Surf","Peer to Peer","Personal Sites and Blogs","Personal Storage","Philosophy and Political Advocacy","Phishing and Other Frauds","Private IP Addresses"]
		policy					= "DENY"
		decryption_exception	= false
	}
	fqdn_filter_list {
		fqdn_list				= ["Proxy Avoidance and Anonymizers","Questionable","Real Estate","Recreation and Hobbies","Reference and Research","Religion","Search Engines","Sex Education"]
		policy					= "DENY"
		decryption_exception	= false
	}
	fqdn_filter_list {
		fqdn_list				= ["Shareware and Freeware","Shopping","Social Networking","Society","SPAM URLS","Sports","Spyware and Adware","Streaming Media"]
		policy					= "DENY"
		decryption_exception	= false
	}
	fqdn_filter_list {
		fqdn_list				= ["Swimsuits and Intimate Apparel","Training and Tools","Translation","Travel","Uncategorised","Unconfirmed SPAM Sources","Violence","Weapons"]
		policy					= "DENY"
		decryption_exception	= false
	}
	fqdn_filter_list {
		fqdn_list				= ["Web Advertisements","Web Hosting","Web-based Emails"]
		policy					= "DENY"
		decryption_exception	= false
	}
	fqdn_filter_list {
		fqdn_list				= ["cloud.tenable.com"]
		policy					= "ALLOW"
		decryption_exception	= true
	}
	default_fqdn_filter {
		policy					= "DENY_NOLOG"
		decryption_exception	= false
	}
}