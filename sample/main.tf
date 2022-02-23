
resource aws_key_pair administrator  {
  key_name = "sd-staging-administrator"
  public_key = "ssh-rsa SOMETHINGHERE administrator@sd.local"
  tags = local.tags
}

resource "aws_security_group" "ssh" {
  name = "sd-staging-ssh"
  vpc_id = "vpc-0fca7c8fbb8d07c5b"
  tags = local.tags
}

resource "aws_security_group_rule" "ssh_egress" {
  security_group_id = aws_security_group.ssh.id
  from_port         = 0
  protocol          = "all"
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh_ingress" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.ssh.id
  to_port           = 22
  type              = "ingress"
}

locals {
  tags = {
    "project" = "sd"
    "environment" = "staging"
    "terraform" = true
  }
}
