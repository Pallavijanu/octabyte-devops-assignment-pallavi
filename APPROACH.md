# Approach Document

## Goals
- Provision secure infrastructure with Terraform.
- Create automated CI/CD pipelines with tests, image build and deployment.
- Implement monitoring & centralized logging.
- Provide clear documentation and backup/secret strategy.

## Steps taken
1. Designed VPC with public and private subnets.
2. Provisioned EC2 instance for container runtime and RDS for PostgreSQL.
3. Configured ALB with target group and health checks.
4. Wrote GitHub Actions pipeline with PR tests, image build & push, staging deploy, and manual production approval.
5. Added Prometheus + Grafana + Loki sample configs and dashboard suggestions.
6. Documented cost, security and backup considerations.

## Improvements possible (notes)
- Replace EC2 with ECS/EKS for scalable container orchestration.
- Add Auto Scaling Group for app instances.
- Use AWS ECR instead of DockerHub.
- Terraform modules for reusability.
