provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "autoscaling_instance" {
  ami           = "ami-12345678"  # Replace with latest Ubuntu AMI ID
  instance_type = "t2.micro"
  key_name      = "your-key"
  
  user_data = file("userdata.sh")

  tags = {
    Name = "AutoScalingInstance"
  }
}
