# Create VPC
resource "aws_vpc" "custom_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "custom_vpc"
  }
}

# Create Subnets
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"  # Change this to your preferred AZ
  tags = {
    Name = "public_subnet"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = {
    Name = "internet_gateway"
  }
}

# Create Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public_rt"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
