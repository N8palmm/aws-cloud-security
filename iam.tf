resource "aws_iam_role" "example_role" {
  name = "example_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
      },
    ],
  })
}

resource "aws_iam_instance_profile" "example_profile" {
  name = "example_profile"
  role = aws_iam_role.example_role.name
}

