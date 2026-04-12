---
name: cloud-infrastructure
description: Cloud infrastructure management (AWS, GCP, Azure). Use for setting up and managing cloud services.
---

# Cloud Infrastructure

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for managing cloud infrastructure. Includes working with AWS, GCP, Azure, configuring networking, storage, and compute services.

## When to Use

Use this skill:
- When setting up cloud infrastructure
- For VPC and networking management
- When configuring storage solutions
- For cloud cost optimization
- When ensuring compliance
- For disaster recovery

## AWS Architecture

### Core Services

| Service | Purpose |
|---------|---------|
| EC2 | Virtual machines |
| ECS/EKS | Containers |
| Lambda | Serverless |
| RDS | Managed databases |
| S3 | Object storage |
| CloudFront | CDN |
| ELB | Load balancing |
| Route 53 | DNS |
| IAM | Access management |
| CloudWatch | Monitoring |
| CloudFormation/Terraform | IaC |

### VPC Architecture

```hcl
# VPC with public and private subnets
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# Public subnet
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block             = "10.0.1.0/24"
  availability_zone     = "eu-central-1a"
  map_public_ip_on_launch = true
}

# Private subnet
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block       = "10.0.10.0/24"
  availability_zone = "eu-central-1a"
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

# NAT Gateway for private subnets
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1.id
}

# Security Groups
resource "aws_security_group" "app" {
  name        = "app-sg"
  description = "Security group for app servers"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
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
```

## Azure Architecture

### Core Services

| Service | Purpose |
|---------|---------|
| Virtual Machines | compute |
| Azure Kubernetes | containers |
| Azure Functions | serverless |
| Azure SQL | databases |
| Blob Storage | object storage |
| CDN | content delivery |
| Load Balancer | load balancing |
| Azure DNS | DNS |
| Azure AD | identity |
| Azure Monitor | monitoring |

## GCP Architecture

### Core Services

| Service | Purpose |
|---------|---------|
| Compute Engine | VMs |
| GKE | Kubernetes |
| Cloud Functions | serverless |
| Cloud SQL | databases |
| Cloud Storage | object storage |
| Cloud CDN | CDN |
| Cloud Load Balancing | load balancing |
| Cloud DNS | DNS |
| IAM | access management |
| Cloud Monitoring | monitoring |

## Storage Solutions

### S3 (AWS)

```hcl
resource "aws_s3_bucket" "app_data" {
  bucket = "myapp-data"
  
  tags = {
    Environment = "production"
  }
}

resource "aws_s3_bucket_versioning" "app_data" {
  bucket = aws_s3_bucket.app_data.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption" "app_data" {
  bucket = aws_s3_bucket.app_data.id
  server_side_encryption_configuration {
    sse_algorithm = "AES256"
  }
}

# Lifecycle policy
resource "aws_s3_bucket_lifecycle_configuration" "app_data" {
  bucket = aws_s3_bucket.app_data.id

  rule {
    id     = "archive-old-versions"
    status = "Enabled"
    
    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "GLACIER"
    }
  }
}
```

## Serverless

### Lambda + API Gateway

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Transform: AWS::Serverless-2016-08-09

Resources:
  MyFunction:
    Type: AWS::Serverless::Function
    Properties:
      Handler: index.handler
      Runtime: nodejs20.x
      CodeUri: .
      Events:
        Api:
          Type: Api
          Properties:
            RestApiId: !Ref MyApi
            Path: /api/{proxy+}
            Method: ANY

  MyApi:
    Type: AWS::Serverless::Api
    Properties:
      StageName: prod
      DefinitionUri: openapi.yaml
```

## Cost Optimization

### Reserved Instances

```hcl
# Reserved Instance for stable load
resource "aws_instance" "app" {
  instance_type = "t3.medium"
  # ...
  
  # Saving Plan
  instance_market_options {
    market_type = "capacity-block"
  }
}

# Spot instances for dev/test
resource "aws_instance" "dev_app" {
  instance_type = "t3.small"
  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "terminate"
    }
  }
}
```

### Budget Alerts

```hcl
resource "aws_budgets_budget" "monthly" {
  name = "monthly-cost-budget"
  
  budget_type = "COST"
  limit_amount = "1000.0"
  limit_unit  = "USD"
  time_unit  = "MONTHLY"

  notification {
    comparison_operator = "GREATER_THAN"
    threshold          = 80
    notification_type  = "FORECASTED"
    
    subscriber {
      type    = "EMAIL"
      address = "team@example.com"
    }
  }
}
```

## Disaster Recovery

### Backup Strategy

| RTO/RPO | Solution |
|---------|----------|
| 4h/1h | Backup & Restore |
| 1h/15m | Pilot Light |
| 15m/1m | Warm Standby |
| 0/0 | Multi-region Active-Active |

```hcl
# Cross-region replication
resource "aws_s3_bucket_replication_configuration" "app_data" {
  role = aws_iam_role.replication.arn
  
  rules {
    id       = "replicate-to-dr"
    status   = "Enabled"
    priority = 1
    
    destination {
      bucket        = "arn:aws:s3:::myapp-dr"
      storage_class = "STANDARD_IA"
      encryption_replica {
        kms_key_arn = aws_kms_key.replica.arn
      }
    }
  }
}
```

## Quality Criteria

- [ ] VPC properly segmented
- [ ] Security groups restrictive
- [ ] Logging enabled
- [ ] Backup strategy defined
- [ ] DR plan documented
- [ ] Costs monitored
- [ ] Auto-scaling configured
- [ ] Compliance requirements met
