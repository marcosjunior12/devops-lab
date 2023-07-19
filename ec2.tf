resource "aws_instance" "web" {
  ami = var.image_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.var.sg_name.id]
  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    service nginx start
  EOF

  tags = {
    Name = "Laboratório Devops.V2"
  }
}