output "instance_ip" {
  value = aws_instance.web-servernew.public_ip
}

output "ec2_instance_id" {
  value = aws_instance.web-servernew.id
}