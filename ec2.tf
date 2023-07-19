resource "aws_instance" "web" {
  ami = var.image_id
  instance_type = "t2.micro"

  tags = {
    Name = "Laboratório Devops"
  }
}