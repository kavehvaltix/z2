output "vm" {
  value = [
    for instance in aws_instance.vm_priv :
    {
      public_ip  = instance.public_ip
      private_ip = instance.private_ip
      az         = instance.availability_zone
      ssh_cmd    = "ssh ubuntu@${instance.public_ip}"
    }
  ]
}
