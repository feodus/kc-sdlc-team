---
name: infrastructure-as-code
description: Infrastructure as Code management using Terraform, Ansible, Pulumi. Use for creating and managing cloud infrastructure.
---

# Infrastructure as Code

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for managing infrastructure as code (IaC). Includes using Terraform, Ansible, Pulumi for automating cloud infrastructure creation and management.

## When to Use

Use this skill:
- When setting up cloud infrastructure
- For server configuration management
- When implementing IaC practices
- For creating reproducible environments
- When managing multiple environments
- For audit and compliance

## Terraform

### Basic Examples

#### AWS EC2

```hcl
# main.tf
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "app" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"
  
  tags = {
    Name        = "myapp-server"
    Environment = "production"
  }
  
  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y docker docker-compose
              EOF
}

resource "aws_security_group" "app" {
  name        = "myapp-sg"
  description = "Security group for myapp"
  
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

#### RDS PostgreSQL

```hcl
resource "aws_db_instance" "postgres" {
  identifier           = "myapp-db"
  engine               = "postgres"
  engine_version      = "15.3"
  instance_class       = "db.t3.medium"
  
  allocated_storage    = 20
  max_allocated_storage = 100
  
  db_name              = "myapp"
  username             = var.db_username
  password             = var.db_password
  
  backup_retention_period = 7
  backup_window         = "03:00-04:00"
  maintenance_window   = "mon:04:00-mon:05:00"
  
  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  
  skip_final_snapshot       = false
  final_snapshot_identifier = "myapp-db-final-snapshot"
  
  tags = {
    Environment = "production"
  }
}
```

### Modules

```hcl
# modules/vpc/main.tf
resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name = "vpc-${var.environment}"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = var.availability_zones[count.index]
  
  tags = {
    Name = "subnet-private-${count.index + 1}"
    Type = "private"
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index + 100)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  
  tags = {
    Name = "subnet-public-${count.index + 1}"
    Type = "public"
  }
}
```

### Workspaces

```bash
# Create workspace
terraform workspace new staging
terraform workspace new production

# Use workspace in code
resource "aws_instance" "app" {
  ami = var.ami_ids[terraform.workspace]
  # ...
}
```

## Ansible

### Playbook example

```yaml
# playbook.yml
---
- name: Configure application servers
  hosts: appservers
  become: yes
  vars:
    app_version: "1.0.0"
  
  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes
        cache_valid_time: 3600
    
    - name: Install required packages
      apt:
        name:
          - docker.io
          - docker-compose
          - nginx
        state: present
    
    - name: Create application directory
      file:
        path: /opt/myapp
        state: directory
        owner: ubuntu
        group: ubuntu
        mode: '0755'
    
    - name: Deploy application
      template:
        src: docker-compose.yml.j2
        dest: /opt/myapp/docker-compose.yml
      notify: restart app
    
    - name: Start application
      docker_compose:
        project_src: /opt/myapp
        state: present
    
  handlers:
    - name: restart app
      docker_compose:
        project_src: /opt/myapp
        restarted: yes
```

### Roles structure

```
roles/
└── myapp/
    ├── tasks/
    │   └── main.yml
    ├── handlers/
    │   └── main.yml
    ├── templates/
    │   └── config.j2
    ├── files/
    │   └── myapp.conf
    ├── vars/
    │   └── main.yml
    └── defaults/
        └── main.yml
```

## State Management

### Remote state

```hcl
terraform {
  backend "s3" {
    bucket         = "myapp-terraform-state"
    key            = "production/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
```

### Locking

```hcl
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}
```

## Best Practices

### Project structure

```
terraform/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── rds/
│   └── elb/
└── global/
    └── s3/
```

### Security

```hcl
# Don't store secrets in code
# Use instead:
variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

# Or HashiCorp Vault
data "vault_generic_secret" "db_creds" {
  path = "secret/database"
}
```

## Quality Criteria

- [ ] Remote state configured
- [ ] Locking enabled
- [ ] Modules used
- [ ] Variables validated
- [ ] Workspaces for environments
- [ ] Secrets not in code
- [ ] Plan before apply
- [ ] State in gitignore
