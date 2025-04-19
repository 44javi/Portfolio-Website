# Portfolio-Website
A personal portfolio website showcasing projects, built with modern cloud native technologies.

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
