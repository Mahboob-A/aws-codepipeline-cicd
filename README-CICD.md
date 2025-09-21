# CI/CD Pipeline Setup

## Overview
Complete AWS CodePipeline setup for Django Todo App with Docker deployment to EC2.

## Pipeline Flow
1. **Source**: GitHub repository trigger
2. **Build**: CodeBuild builds Docker image and pushes to ECR
3. **Deploy**: CodeDeploy deploys to EC2 instance

## Prerequisites
1. AWS CLI configured
2. GitHub personal access token
3. EC2 Key Pair created

## Setup Steps

### 1. Update Configuration
Edit `deploy/production/aws/setup-pipeline.sh`:
```bash
GITHUB_REPO="your-username/aws-code-pipe-line-demo-todo"
KEY_PAIR_NAME="your-key-pair"
```

### 2. Create GitHub Token Secret
```bash
aws secretsmanager put-secret-value \
    --secret-id github-token \
    --secret-string '{"token":"your-github-token"}'
```

### 3. Deploy Pipeline
```bash
cd deploy/production/aws
./setup-pipeline.sh
```

### 4. Update AppSpec Environment Variables
Edit `appspec.yml` with your AWS account details:
```yaml
env:
  AWS_DEFAULT_REGION: your-region
  AWS_ACCOUNT_ID: "your-account-id"
```

## Pipeline Components

### Files Created:
- `buildspec.yml` - CodeBuild configuration
- `appspec.yml` - CodeDeploy configuration  
- `deploy/production/scripts/deploy.sh` - Deployment script
- `deploy/production/scripts/install_dependencies.sh` - Dependencies setup
- `deploy/production/aws/cloudformation-pipeline.yml` - Infrastructure as Code

### AWS Resources:
- ECR Repository for Docker images
- CodeBuild project for building images
- CodeDeploy application for deployment
- EC2 instance for hosting
- S3 bucket for artifacts
- IAM roles and policies

## Access Application
After deployment, access your app at: `http://EC2-PUBLIC-IP:8000`

## Monitoring
- CodePipeline: AWS Console > CodePipeline
- CodeBuild: AWS Console > CodeBuild
- CodeDeploy: AWS Console > CodeDeploy
- EC2 Logs: SSH to instance and check Docker logs