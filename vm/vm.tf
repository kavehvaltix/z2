data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

resource "aws_instance" "vm_priv" {
  ami                         = data.aws_ami.ubuntu.id
  availability_zone           = var.zones
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.private_security_group.id]
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name

  root_block_device {
    delete_on_termination = true
  }

  tags = {
    Name   = "${var.prefix}_vm"
    prefix = var.prefix
    role   = "prod"
  }
  volume_tags = {
    Name   = "${var.prefix}_vm"
    prefix = var.prefix
  }

  user_data = <<EOF
#!/bin/bash
EOF

}
