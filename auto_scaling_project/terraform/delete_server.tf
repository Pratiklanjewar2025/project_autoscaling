resource "aws_instance" "unused_servers" {
  count = length(var.terminate_instances)
  instance_id = var.terminate_instances[count.index]
}
