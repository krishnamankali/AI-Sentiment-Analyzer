variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID
}

variable "key_name" {
  description = "Key pair for SSH access"
  type        = string
  default     = "ai-keypair"  # Replace with your key pair name
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "ai-eks-cluster"
}

variable "s3_bucket_name" {
  description = "S3 bucket name for AI data storage"
  type        = string
  default     = "ai-sentiment-analyzer-bucket"
}

variable "eks_role_arn" {
  description = "IAM Role ARN for EKS Cluster"
  type        = string
  default     = "arn:aws:iam::123456789012:role/EKSRole"  # Replace with your IAM role
}
