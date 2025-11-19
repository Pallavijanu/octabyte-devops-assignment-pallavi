# DevOps Assignment – 8byte.ai  
Author: **Pallavi L R**

This repository contains the complete solution for the 8byte DevOps Engineer Technical Assignment.  
It includes Infrastructure-as-Code (Terraform), CI/CD automation, monitoring & logging setup, Dockerization, and a simple frontend deployed on Netlify.

---

#  Project Overview

This project demonstrates:

- Infrastructure provisioning using **Terraform**
- CI/CD automation using **GitHub Actions**
- Containerization using **Docker**
- Monitoring using **Prometheus & Grafana**
- Centralized logging
- Static frontend hosted on **Netlify**

---

#  Folder Structure

octabyte_assignment/
│── infra/ # Terraform infrastructure
│── sample_app/ # Backend + static frontend (index.html)
│── prometheus/ # Monitoring configuration
│── grafana/ # Dashboards
│── logging/ # Logging setup
│── .github/workflows/ # CI/CD pipeline
│── Dockerfile
│── README.md
│── APPROACH.md
│── CHALLENGES.md


---

#  Frontend Deployment (Netlify)

A simple frontend (index.html) is deployed on Netlify.

🔗 **Live URL:** https://spontaneous-palmier-3d4759.netlify.app  
Deployed from the `sample_app` directory.

---

#  CI/CD Pipeline Overview

The CI/CD pipeline uses **GitHub Actions**:

- On PR → Run tests  
- On merge to main →  
  ✔ Build Docker image  
  ✔ Push to container registry  
  ✔ Deploy to AWS  
  ✔ Run security scans  
- Manual approval step before production deployment  

---

#  Infrastructure Components

- **VPC** (public + private subnets)
- **EC2** for application hosting
- **RDS PostgreSQL**
- **Application Load Balancer**
- **Security groups**
- **S3 backend + DynamoDB** for Terraform state

---

#  Monitoring & Logging

- **Prometheus** → Collect infrastructure & app metrics  
- **Grafana** → Dashboards for:
  - Request latency
  - Error rate
  - CPU & memory
  - DB metrics  
- **Logging stack** → Application logs + system logs + access logs

---

#  Security Considerations

- Least privilege IAM  
- No public access to RDS  
- Secrets stored securely (not committed)  
- Security group restrictions  
- Private subnets for sensitive resources  

---

#  Cost Optimization

- t2.micro / t3.micro instances  
- Free-tier eligible resources  
- Low retention for dev logs  
- Single NAT gateway  
- Auto-shutdown for unused resources  

---

#  Deploy Infrastructure (Terraform)

cd infra
terraform init
terraform plan
terraform apply


Ensure backend S3 bucket + DynamoDB table are configured.

---

#  Run Application Locally

cd sample_app
npm install
node index.js


---

#  Additional Documentation

- **APPROACH.md** – reasoning & architecture  
- **CHALLENGES.md** – issues & resolutions  

---

#  Contact
Prepared by **Pallavi L R** for 8byte.ai DevOps assignment.
