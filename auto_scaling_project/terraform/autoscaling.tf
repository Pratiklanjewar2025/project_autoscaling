variable "max_servers" {
  default = 10
}

resource "aws_autoscaling_group" "auto_scale" {
  min_size = 1
  max_size = var.max_servers
  desired_capacity = 1
  launch_configuration = aws_launch_configuration.config.id
}

resource "aws_launch_configuration" "config" {
  name = "auto-scale-config"
  image_id = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  user_data = file("${path.module}/userdata.sh")
}
