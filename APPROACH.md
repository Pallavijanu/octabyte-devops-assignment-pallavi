# APPROACH – DevOps Assignment (8byte.ai)

This document explains the reasoning, architecture, and decisions made when completing the 8byte DevOps assignment.

---

#  Infrastructure Approach (Terraform + AWS)

I chose AWS as the cloud provider because it is widely used, reliable, and aligns with standard DevOps practices.

## VPC Architecture

- **Public subnets** → Load balancer and NAT gateway  
- **Private subnets** → EC2 application servers + RDS PostgreSQL  
- Route tables configured for secure routing  
- NAT gateway allows private instances outbound access without exposing them publicly  

This follows the best practice of **multi-tier architecture**.

---

#  Compute Layer – EC2

For application hosting, **EC2** was selected because:

- It is simple and predictable  
- Easy to configure security groups  
- Ideal for assignments requiring manual deployment  
- No need for autoscaling or managed orchestration for this simple app  

---

#  Terraform Structure & State Management

Terraform is organized into logical directories with:

- **variables.tf** for configuration  
- **outputs.tf** for exposing key resources  
- **provider.tf** configured to use:
  - **S3 bucket** for remote state  
  - **DynamoDB table** for state locking  

This ensures safe, collaborative, and scalable IaC management.

---

#  CI/CD Approach – GitHub Actions

## Actions pipeline includes:

- Running tests on PR  
- Building Docker image  
- Pushing image to Docker registry  
- Deploying to AWS EC2  
- Basic vulnerability scanning  
- Manual approval step for production deployment  

This ensures proper automation from code → deploy.

---

#  Monitoring Approach – Prometheus & Grafana

Prometheus was used to collect:

- CPU usage  
- Memory usage  
- Disk I/O  
- Application request metrics  
- Error rates  
- Latency  

Grafana was set up with:

- **Two meaningful dashboards**:
  1. Infra metrics dashboard  
  2. Application metrics dashboard  

This satisfies the monitoring requirements of the assignment.

---

#  Logging Approach – Centralized Logging

Logging stack includes:

- Application logs  
- System logs  
- Access logs  

The logs are organized in the `/logging` directory.

---

#  Frontend Deployment – Netlify

A simple **static HTML frontend** was deployed on Netlify because:

- Netlify is free and quick  
- No backend processing required  
- static HTML loads instantly  
- Very easy to integrate with GitHub  

##  Live URL:
https://spontaneous-palmier-3d4759.netlify.app

---

#  Security Practices Implemented

- IAM least privilege  
- RDS not publicly accessible  
- SSH restricted to specific IPs  
- Secrets stored securely (not hardcoded)  
- Security group isolation  
- No sensitive data committed to repo  

---

#  Cost Optimization

AWS free-tier friendly:

- t2.micro/t3.micro instances  
- Small RDS instance  
- One NAT gateway  
- Logs with short retention  
- Minimum storage allocations  

---

#  Backup & Secret Management

- RDS automated backups enabled  
- Application secrets managed using environment variables / SSM  
- No secrets included inside the codebase  

---

#  Summary

This assignment was designed using industry best practices, ensuring:

- Security  
- Scalability  
- Automation  
- Monitoring  
- Cost efficiency  

The chosen tools, architecture, and workflow form a complete, production-ready DevOps setup.

