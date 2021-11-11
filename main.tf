module "vpc" {
  for_each	         = var.spoke_vpcs
  source        	 = "./vpc"
  prefix        	 = each.value.prefix
  vpc_cidr      	 = each.value.vpc_cidr
  subnet_bits  		 = each.value.subnet_bits
  aws_provider_alias = each.value.aws_provider_alias
  zones              = var.valtix_aws_azs
}

module "vm" {
  for_each      	 = var.spoke_vms
  source        	 = "./vm"
  prefix        	 = each.value.prefix
  aws_provider_alias = each.value.aws_provider_alias
  zones            = var.valtix_aws_azs
  key_name         = var.ec2_ssh_key_name
  instance_type    = var.ec2_instance_type
  subnet_id        = module.vpc.subnet_id
}

//[for key, value in var.spoke_vpcs : module.spoke_vpc[key].vpc.id]