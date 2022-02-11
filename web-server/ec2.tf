# security group
resource "aws_security_group" "example_ec2_sg" {
  name        = "example-ec2-sg"
  description = "EC2 Security Group"
  vpc_id      = aws_vpc.example_vpc.id

  tags = {
    Name = "example_ec2_sg"
  }
}

# allow requests from external to 80 port
resource "aws_security_group_rule" "example_ec2_in_http" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.example_ec2_sg.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

# allow web servers to connect to external
resource "aws_security_group_rule" "example_ec2_out" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.example_ec2_sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_instance" "example_ec2" {
  instance_type = "t2.micro"
  ami           = "ami-08d56ac42e2d4a08b"
  subnet_id     = aws_subnet.example_subnet_a.id
  vpc_security_group_ids = [
    aws_security_group.example_ec2_sg.id
  ]
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install -y httpd
uname -n > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd
EOF

  tags = {
    Name = "example-ec2"
  }
}


