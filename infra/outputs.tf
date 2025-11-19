output "load_balancer_dns" { value = aws_lb.alb.dns_name }
output "db_endpoint" { value = aws_db_instance.postgres.address }
output "app_instance_id" { value = aws_instance.app.id }
