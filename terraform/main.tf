# Definir o provedor AWS
provider "aws" {
  region = var.region
}

# Obter dados de uma VPC existente
data "aws_vpc" "main_vpc" {
  id = var.vpc_id
}

# Obter dados de uma subnet existente
data "aws_subnet" "existing_subnet" {
  id = var.subnet_id
}

# Obter dados de um Internet Gateway existente
data "aws_internet_gateway" "main_gateway" {
  id = var.igw_id
}

# Security Group dentro da VPC existente
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Security group for web server"
  vpc_id      = data.aws_vpc.main_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Instância EC2 usando a subnet e o security group existentes
resource "aws_instance" "web_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "UbuntuServer"
  }
}
