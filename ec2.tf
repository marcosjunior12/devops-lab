resource "aws_security_group" "my-sg" {
  name        = var.sg_name
  description = "Grupo de seguranca permitindo conexoes HTTP e HTTPS"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami = var.image_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my-sg.id]
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