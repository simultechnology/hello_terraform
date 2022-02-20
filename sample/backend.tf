terraform {
  backend "s3" {
    bucket = "my-terraform-resources"
    region = "ap-northeast-1"
    profile = "default"
    key = "terraform.tfstate"
    encrypt = true
  }
}
