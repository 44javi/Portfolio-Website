# Portfolio-Website
A personal portfolio website showcasing projects, built with modern cloud native technologies.

**Live Site**: [portfolioforjavier.com](https://portfolioforjavier.com)

## Table of Contents
* Overview
* Pre-requisites
* Deployment Steps
* Architecture
* Technical Stack
* Project Structure

## Overview
This repository contains the infrastructure code and frontend files for my personal portfolio website. It uses containerization, infrastructure as code, and Azure.

## Pre-requisites
* Docker    - [Installation Guide](https://docs.docker.com/get-docker/)
* Azure CLI - [Installation Guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
* Terraform - [Installation Guide](https://developer.hashicorp.com/terraform/install)
* Azure Subscription
* Custom domain name 

## Deployment Steps

1. **Infrastructure Deployment**
  * Set up shared infrastructure repository first
  * Run `terraform init`
  * Run `terraform plan` 
  * Run `terraform apply` to deploy Container App Environment

2. **Application Deployment**
  * Build Docker image: `docker build -t <username>/portfolio:latest .`
  * Push to Docker Hub: `docker push <username>/portfolio:latest`
  * Run `terraform init` 
  * Run `terraform plan` 
  * Run `terraform apply` to deploy the Container App

3. **Custom Domain Configuration**
  * After applying Terraform, you'll receive the custom domain verification ID in the terminal
  * Create DNS records in Cloudflare:
    * A record: `@ → [Container App Environment IP]`
    * CNAME record: `www → [Container App FQDN]`
    * TXT record: `asuid → [Custom Domain Verification ID]`
    * TXT record: `asuid.www → [Custom Domain Verification ID]`
    * Set records to DNS-only mode initially (gray cloud)
  * Wait for certificate provisioning (status: "Secured")
  * Enable Cloudflare proxying (orange cloud)

### Current Architecture
- Migrated to containerized deployment with Azure Container Apps
- Infrastructure defined with Terraform using modular approach:
- Multi-repository approach:
  - Core infrastructure in a separate shared repository
  - Application specific configurations in this repository
- Custom domain configuration with Azure managed SSL certificates
- DNS management through Cloudflare with:
  - A record for apex domain
  - CNAME record for www subdomain
  - Required TXT records for domain verification

## Technical Stack
- **Frontend**: HTML/CSS
- **Hosting**: Azure Container Apps
- **Infrastructure**: Terraform
- **DNS & Security**: Cloudflare
- **Container**: Docker
- **CI/CD**: Azure DevOps (In Progress)