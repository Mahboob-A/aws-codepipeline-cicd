#!/bin/bash

set -e

STACK_NAME="todo-app-pipeline"
GITHUB_REPO="your-username/aws-code-pipe-line-demo-todo"
GITHUB_BRANCH="main"
KEY_PAIR_NAME="your-key-pair"

echo "Setting up CI/CD Pipeline..."

# Create GitHub token in Secrets Manager (run this once)
echo "Creating GitHub token secret..."
aws secretsmanager create-secret \
    --name github-token \
    --description "GitHub personal access token for CodePipeline" \
    --secret-string '{"token":"your-github-token"}' \
    --region us-east-1 || echo "Secret already exists"

# Deploy CloudFormation stack
echo "Deploying CloudFormation stack..."
aws cloudformation deploy \
    --template-file cloudformation-pipeline.yml \
    --stack-name $STACK_NAME \
    --parameter-overrides \
        GitHubRepo=$GITHUB_REPO \
        GitHubBranch=$GITHUB_BRANCH \
        EC2KeyPair=$KEY_PAIR_NAME \
    --capabilities CAPABILITY_IAM \
    --region us-east-1

echo "Pipeline setup completed!"
echo "Check the AWS Console for pipeline status."