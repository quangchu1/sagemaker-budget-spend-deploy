output "notebook_instance_1_name" {
  description = "Name of the first SageMaker notebook instance"
  value       = aws_sagemaker_notebook_instance.budget_spend_1.name
}

output "notebook_instance_1_arn" {
  description = "ARN of the first SageMaker notebook instance"
  value       = aws_sagemaker_notebook_instance.budget_spend_1.arn
}

output "notebook_instance_2_name" {
  description = "Name of the second SageMaker notebook instance"
  value       = aws_sagemaker_notebook_instance.budget_spend_2.name
}

output "notebook_instance_2_arn" {
  description = "ARN of the second SageMaker notebook instance"
  value       = aws_sagemaker_notebook_instance.budget_spend_2.arn
}

output "instance_type" {
  description = "SageMaker instance types"
  value       = "ml.g4dn.12xlarge + ml.g4dn.8xlarge (7x NVIDIA T4 GPUs total)"
}

output "daily_cost_estimate" {
  description = "Estimated daily cost in USD"
  value       = "482.00 (12xlarge: $276 + 8xlarge: $206)"
}

output "total_budget_target" {
  description = "Total budget target by Dec 24, 2025"
  value       = "19280 USD over 40 days (exceeds $11,000 goal)"
}
