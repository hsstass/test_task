provider "aws" {
  access_key = "AKIASYU5GPSU6JDMAMXP"
  secret_key = "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"
  region     = "eu-central-1"
}

resource "aws_instance" "Ubuntu_1_1" {
  ami           = "ami-0a49b025fffbbdac6"
  instance_type = "t3.micro"
  key_name      = "my_key"
}
