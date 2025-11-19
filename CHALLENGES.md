# CHALLENGES & SOLUTIONS – DevOps Assignment

This document highlights the main challenges encountered during the assignment and how each issue was resolved.

---

# Terraform State Management Issue

## Challenge  
Terraform showed S3 backend locking and permission errors.

## Solution  
- Configured correct IAM permissions  
- Ensured DynamoDB table exists for state locking  
- Re-ran `terraform init` after fixing backend  

---

# EC2 Not Accessible (SSH Failure)

## Challenge  
EC2 instance was unreachable initially.

## Reason  
Wrong inbound rules in the Security Group.

## Solution  
- Allowed SSH only from my local IP  
- Added outbound rules for NAT gateway  
- Re-applied Terraform  

---

#  Docker Image Push Failed

##  Challenge  
GitHub Actions could not push Docker image to registry.

##  Solution  
- Added correct Docker credentials in GitHub Secrets (`DOCKER_USER`, `DOCKER_PASS`)  
- Added `docker/login-action` in CI/CD pipeline  

---

#  GitHub Actions Pipeline Failed

##  Challenge  
Pipeline broke due to Node version mismatch and YAML indentation errors.

##  Solution  
- Used `actions/setup-node@v3` to specify Node version  
- Fixed working-directory paths  
- Corrected YAML indentation  

---

# Prometheus Could Not Scrape Targets

##  Challenge  
Prometheus showed targets as DOWN.

##  Solution  
- Opened required ports in Security Groups  
- Corrected Prometheus `scrape_configs`  
- Restarted service  

---

#  ALB Health Check Failed

##  Challenge  
Load Balancer was marking EC2 as unhealthy.

##  Solution  
- Updated health check path  
- Allowed port 80 in EC2 Security Group  
- Ensured application listens on correct port  

---

#  Netlify Not Detecting index.html

##  Challenge  
Netlify showed “Page Not Found”.

##  Solution  
- Set Base Directory = `sample_app`  
- Set Publish Directory = `sample_app`  
- Redeployed successfully  

---

##  RDS Connectivity Issue

## Challenge  
EC2 could not connect to RDS initially.

## Solution  
- Placed RDS in private subnet  
- Allowed inbound traffic only from EC2 Security Group  
- Ensured DB username/password via variables  

---

# Summary

These challenges improved understanding of:

- Terraform debugging  
- AWS networking  
- CI/CD automation  
- Monitoring configuration  
- Documentation and problem-solving  

All issues were resolved and the assignment was completed successfully.
