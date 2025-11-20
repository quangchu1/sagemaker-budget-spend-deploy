variable "aws_region" {
  description = "AWS region for SageMaker resources"
  type        = string
  default     = "ap-southeast-1"
}

variable "aws_profile" {
  description = "AWS profile to use for authentication"
  type        = string
  default     = "210758598268_VNM_Partner"
}

variable "vpc_id" {
  description = "VPC ID for SageMaker resources"
  type        = string
  default     = "vpc-0019015fbabe4ab1e"
}

variable "subnet_id" {
  description = "Subnet ID for SageMaker notebook instance 1"
  type        = string
  default     = "subnet-02d0f129eb147cdeb"
}

variable "subnet_id_2" {
  description = "Subnet ID for SageMaker notebook instance 2"
  type        = string
  default     = "subnet-02d0f129eb147cdeb"
}
