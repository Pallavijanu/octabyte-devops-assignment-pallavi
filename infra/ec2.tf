resource "aws_instance" "app" {
  ami           = "ami-0e670eb768a5f9fa9" # replace with region-appropriate AMI
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  tags = { Name = "octabyte-app-instance" }

  user_data = <<EOF
#!/bin/bash
apt-get update -y
apt-get install -y docker.io
systemctl start docker
docker run -d -p 3000:3000 --restart unless-stopped pallavi/octabyte-app:latest
EOF
}
