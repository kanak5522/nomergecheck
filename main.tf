
provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "yoknk" {
    ami = "ami-04e49d62cf88738f1"
    instance_type = "t2.micro"
  
}

resource "aws_instance" "kanak4" {
    ami = "ami-04e49d62cf88738f1"
    instance_type = "t2.micro"
  
}
