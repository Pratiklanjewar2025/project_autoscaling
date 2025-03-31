provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "autoscale_server" {
  ami = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  key_name = "pratik-linux-key1"
  security_groups = ["sg-0a06f350d00ce013c"]
  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "AutoScalingServer"
  }
}
