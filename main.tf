resource "aws_instance" "hello" {
  ami           = "ami-0701e21c502689c31"
  instance_type = "t2.micro"

  tags = {
    Name = "my_hello"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

