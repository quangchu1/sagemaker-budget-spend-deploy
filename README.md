# SageMaker Budget Spend Solution - Dual Instance 24/7

## Goal
Spend $11,000 on SageMaker from Nov 14, 2025 to Dec 24, 2025 (40 days)

## Enhanced Solution
- **Instance 1**: ml.g4dn.12xlarge (4x NVIDIA T4 GPUs) - $276/day
- **Instance 2**: ml.g4dn.8xlarge (3x NVIDIA T4 GPUs) - $206/day
- **Total Cost**: $482/day
- **Operation**: 24/7 (no scheduling needed)
- **Total**: $482 × 40 days = $19,280 (exceeds goal)

## Architecture
- Two SageMaker Notebook Instances (different sizes)
- Multi-AZ deployment (different subnets)
- Security Group with outbound internet access
- IAM role with SageMaker permissions
- No Lambda or scheduling complexity

## Deployment

```bash
terraform init
terraform plan
terraform apply
```

## Testing

```bash
# Check status of both instances
aws sagemaker describe-notebook-instance --notebook-instance-name budget-spend-g4dn-12xlarge-1 --profile 210758598268_VNM_Partner --region ap-southeast-1
aws sagemaker describe-notebook-instance --notebook-instance-name budget-spend-g4dn-8xlarge-2 --profile 210758598268_VNM_Partner --region ap-southeast-1
```

## Cost Monitoring
- Daily cost: $482 ($276 + $206)
- Total: $19,280 (1.75x the $11,000 target)
- Monitor via AWS Cost Explorer

## Cleanup
```bash
terraform destroy
```
