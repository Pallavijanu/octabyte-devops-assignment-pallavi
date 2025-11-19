# Octa Byte AI - Assignment Repository

## What this repo contains
- Terraform infrastructure code (infra/)
- GitHub Actions CI/CD workflow (.github/workflows/deploy.yml)
- Dockerfile for application
- Prometheus + Grafana config samples
- Promtail (Loki) logging config
- Documentation and approach notes

## Quick start (development)
1. Clone the repo.
2. Add secrets to GitHub: DOCKER_USER, DOCKER_PASS, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, DB_USER, DB_PASS.
3. Edit `infra/provider.tf` backend block to use your S3 bucket and DynamoDB table for state locking.
4. Run locally:
   ```bash
   cd infra
   terraform init
   terraform apply -var="db_username=youruser" -var="db_password=yourpassword" -auto-approve
   ```
5. Push to GitHub; workflow will run CI/CD as defined.

## Architecture decisions
- Use public subnet for ALB and private subnet for app & RDS to minimize exposure.
- Use ALB health checks on /health endpoint.
- Use S3 backend for Terraform state for collaboration and locking.

## Security considerations
- Secrets stored in GitHub Actions secrets.
- RDS not publicly available.
- Security groups restrict inbound traffic.

## Cost optimization
- t3.micro instances (free-tier friendly)
- Shorter log retention in dev
- On-demand resources for staging; consider spot/scale for production

## Monitoring & Logging
- Prometheus scrapes node metrics and app metrics.
- Grafana dashboards visualize infrastructure and app health.
- Loki + Promtail aggregate logs.

## Backup & Secret Management
- RDS automated backups.
- Use AWS SSM Parameter Store or AWS Secrets Manager for secrets in production.
