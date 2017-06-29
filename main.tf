#
# DO NOT DELETE THESE LINES!
#
# Your AMI ID is:
#
#     ami-2378f540
#
# Your subnet ID is:
#
#     subnet-fdf3c88b
#
# Your security group ID is:
#
#     sg-67393600
#
# Your Identity is:
#
#     datapipe-puffin
#

terraform {
  backend "atlas" {
     name = "ttse/training"
   }
}

provider "aws" {
  access_key = "AKIAJABPQ4A72AINY6QA"
  secret_key = "ZJFxFr0kCYjBfr9w7gylJeCrX2nFvbVwTjJ4IODo"
  region     = "ap-southeast-1"
}

resource "aws_instance" "web" {
  ami                    = "ami-2378f540"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-fdf3c88b"
  vpc_security_group_ids = ["sg-67393600"]
  count = 3

  tags {
    Identity = "datapipe-puffin"
    Owner = "ABC"
    Name = "123456"
    Label = "test"
  }
}

variable "num_webs" {
  default = 3
}

variable "aws_access_key" {
  type = "string"
}

variable "aws_secret_key" {
  type = "string"
}

variable "aws_region" {
  type    = "string"
  default = "ap-southeast-1"
}

output "Name_Tag" {
  value = "${aws_instance.web.*.tags.Name}"
}

output "public_ip" {
  value = "${aws_instance.web.*.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.web.*.public_dns}"
}



