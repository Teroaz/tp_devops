provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Security group for web server"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebServerSG"
  }
}

resource "aws_instance" "web_instance" {
  ami                    = "ami-0f292e438e2534879"  # Remplacez par l'ID de votre AMI
  instance_type          = "t2.micro"               # Ou un autre type d'instance selon vos besoins
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = "vockey"

  tags = {
    Name = "WebAppInstance"
  }
}
