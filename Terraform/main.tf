resource "aws_vpc" "devops_vpc" {
  cidr_block = var.vpc_cidr

tags = {
  Name = "DevOps-VPC"
  }
}

resource "aws_subnet" "devops_vpc_subnet" {
  cidr_block = var.subnet_cidr
  vpc_id = aws_vpc.devops_vpc.id

tags = {
  Name = "DevOps-VPC-Subnet"
  }
}

resource "aws_security_group" "devops_sg" {
  name   = "devops-sg"
  vpc_id = aws_vpc.devops_vpc.id

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

resource "aws_instance" "devops_instance" {

  ami           = "ami-0c02fb55956c7d316"
  instance_type = var.instance_type

  subnet_id = aws_subnet.devops_vpc_subnet.id

  vpc_security_group_ids = [
    aws_security_group.devops_sg.id
  ]

  tags = {
    Name = "DevOps-Instance"
  }
}


resource "aws_s3_bucket" "devops_bucket" {
  bucket = var.bucket_name 

  tags = {
    Name = "DevOps-Bucket"
  }
}