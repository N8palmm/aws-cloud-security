output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main_vpc.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.example_instance.public_ip
}

