provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "ai_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "ai-vpc" }
}

resource "aws_subnet" "ai_subnet" {
  vpc_id     = aws_vpc.ai_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = { Name = "ai-subnet" }
}

resource "aws_security_group" "ai_sg" {
  vpc_id = aws_vpc.ai_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "ai-security-group" }
}

resource "aws_instance" "ai_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Update to a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.ai_subnet.id
  vpc_security_group_ids = [aws_security_group.ai_sg.id]
  key_name      = "ai-keypair"  # Update with your key pair
  tags = { Name = "ai-instance" }
}

resource "aws_s3_bucket" "ai_bucket" {
  bucket = "ai-sentiment-analyzer-bucket"
  acl    = "private"
  tags = { Name = "AI Sentiment Analyzer Data" }
}

resource "aws_eks_cluster" "ai_eks" {
  name     = "ai-eks-cluster"
  role_arn = "arn:aws:iam::123456789012:role/EKSRole"  # Replace with your IAM role
  vpc_config {
    subnet_ids = [aws_subnet.ai_subnet.id]
  }
}

output "instance_public_ip" {
  value = aws_instance.ai_instance.public_ip
}
