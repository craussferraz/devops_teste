variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

variable "ami" {
  description = "The AMI to use for the server"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the existing subnet"
  type        = string
}

variable "igw_id" {
  description = "The ID of the existing Internet Gateway"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the AWS EC2"
  default     = "t3a.small"
}
