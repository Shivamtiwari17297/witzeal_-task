# Create a new key pair
resource "aws_key_pair" "generated_key" {
  key_name   = "my_generated_key"
  public_key = tls_private_key.generated_key.public_key_openssh
}

resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "private_key" {
  content  = tls_private_key.generated_key.private_key_pem
  filename = "${path.module}/my_generated_key.pem"
}
