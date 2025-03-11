#!/bin/bash
echo "Setting up AI-Sentiment-Analyzer Project..."

# Install Python dependencies
pip install -r requirements.txt

# Initialize Terraform
cd ../terraform
terraform init

# Deploy Jenkins
cd ../ci-cd
docker-compose up -d jenkins

echo "Setup complete!"
