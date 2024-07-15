# Create EC2 Instance
resource "aws_instance" "web-servernew" {
  ami           = "ami-04a81a99f5ec58529"  # Amazon Linux 2 AMI (change as needed)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.sg.id]
  key_name      = aws_key_pair.generated_key.key_name

  tags = {
    Name = "WebServer"
  }

  user_data = <<-EOF
              
              # Install Ansible
              amazon-linux-extras install ansible2 -y
              EOF
}