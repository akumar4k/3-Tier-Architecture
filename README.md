# 3-Tier-Architecture

This project provisions a 3-tier architecture on Azure using Terraform with reusable modules. The architecture includes:

Frontend: React.js app hosted on Azure App Services.

Backend: Java-based API deployed on Azure Kubernetes Service (AKS).

Dev & UAT: Public AKS cluster.

Prod: Private AKS cluster.

Database: MongoDB hosted on Azure CosmosDB.

Project Structure
terraform-3tier-arch/
│── modules/
│   ├── app_service/
│   ├── aks/
│   ├── mongodb/
│── main.tf
│── variables.tf
│── versions.tf
│── terraform.tfvars
│── backend.tf
│── README.md
Prerequisites

Terraform (>= v1.3.0)

Azure CLI (Logged in using az login)

Service Principal (if required for authentication)
Setup and Deployment

1. Initialize Terraform
2. terraform init

3. terraform plan

4. terraform apply -auto-approve

5. Modules

1. App Service (Frontend - React.js)

Deployed using Azure App Services

Configured with a Linux App Service Plan

2. AKS (Backend - Java API)

Public AKS for Dev & UAT

Private AKS for Production

System Assigned Identity for Authentication

3. MongoDB (Database Layer)

MongoDB Atlas on Azure CosmosDB

Configured with Session Consistency


CI/CD Pipeline to Build & Push to ACR
You need to set up GitHub Actions or Azure DevOps to:

Build Docker images
Push them to ACR
Deploy to App Service (Frontend)
Deploy to AKS (Backend)
