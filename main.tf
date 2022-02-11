resource "aws_instance" "hello" {
  ami           = "ami-0df99b3a8349462c6"
  instance_type = "t2.micro"

  tags = {
    Name = "my_hello"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

