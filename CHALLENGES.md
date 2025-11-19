# Challenges Faced & Resolutions

1. VPC/Subnet misconfiguration:
   - Issue: Instances could not reach RDS.
   - Fix: Corrected subnet associations and route tables.

2. Docker push failed in GitHub Actions:
   - Issue: Missing DockerHub secrets.
   - Fix: Added DOCKER_USER and DOCKER_PASS to repository secrets.

3. ALB health checks failing:
   - Issue: App didn't expose /health endpoint.
   - Fix: Added a lightweight /health route to the app.

4. Terraform state concurrency:
   - Issue: Potential conflicting state changes.
   - Fix: Recommend enabling DynamoDB table for state locking.
