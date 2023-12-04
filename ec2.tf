resource "aws_instance" "example_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main_subnet.id
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.example_profile.name

  tags = {
    Name = "ExampleInstance"
  }
}

