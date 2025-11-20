terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# IAM role for SageMaker
resource "aws_iam_role" "sagemaker_role" {
  name = "sagemaker-budget-spend-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "sagemaker_execution_role" {
  role       = aws_iam_role.sagemaker_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
}

# Security Group for SageMaker
resource "aws_security_group" "sagemaker_sg" {
  name_prefix = "sagemaker-budget-spend-"
  vpc_id      = var.vpc_id
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "sagemaker-budget-spend-sg"
  }
}

# SageMaker Notebook Instance 1 - ml.g4dn.12xlarge (24/7)
resource "aws_sagemaker_notebook_instance" "budget_spend_1" {
  name                    = "budget-spend-g4dn-12xlarge-1"
  role_arn               = aws_iam_role.sagemaker_role.arn
  instance_type          = "ml.g4dn.12xlarge"
  subnet_id              = var.subnet_id
  security_groups        = [aws_security_group.sagemaker_sg.id]
  direct_internet_access = "Enabled"
  
  tags = {
    Purpose = "Budget Spend Goal 24x7"
    Target  = "11000 USD by 2025-12-24"
    Cost    = "276 USD per day"
    Instance = "1"
  }
}

# SageMaker Notebook Instance 2 - ml.g4dn.8xlarge (24/7)
resource "aws_sagemaker_notebook_instance" "budget_spend_2" {
  name                    = "budget-spend-g4dn-8xlarge-2"
  role_arn               = aws_iam_role.sagemaker_role.arn
  instance_type          = "ml.g4dn.8xlarge"
  subnet_id              = var.subnet_id_2
  security_groups        = [aws_security_group.sagemaker_sg.id]
  direct_internet_access = "Enabled"
  
  tags = {
    Purpose = "Budget Spend Goal 24x7"
    Target  = "11000 USD by 2025-12-24"
    Cost    = "206 USD per day"
    Instance = "2"
  }
}
