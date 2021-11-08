data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

data "aws_ami" "valtix_ubuntu" {
  most_recent = true
  owners      = ["902505820678"]

  filter {
    name   = "name"
    values = ["valtix-ubuntu*"]
  }
}

resource "aws_instance" "vm_priv" {
  count                       = length(var.zones)
  ami                         = data.aws_ami.ubuntu.id
  availability_zone           = var.zones[count.index]
  subnet_id                   = aws_subnet.private_subnet[count.index].id
  vpc_security_group_ids      = [aws_security_group.private_security_group.id]
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name

  root_block_device {
    delete_on_termination = true
  }

  tags = {
    Name   = "${var.prefix}_vm-${count.index + 1}"
    prefix = var.prefix
    role   = "prod"
  }
  volume_tags = {
    Name   = "${var.prefix}_vm-${count.index + 1}"
    prefix = var.prefix
  }

  user_data = <<EOF
#!/bin/bash
EOF

}
