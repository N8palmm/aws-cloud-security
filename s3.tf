resource "aws_s3_bucket" "example_bucket" {
  bucket = "nimbus-security-project"  # Replace with your unique bucket name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "MyExampleBucket"
  }
}

resource "aws_s3_bucket_policy" "example_bucket_policy" {
  bucket = aws_s3_bucket.example_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        },
        Action = "s3:GetBucketAcl",
        Resource = "arn:aws:s3:::nimbus-security-project"
      },
      {
        Effect = "Allow",
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        },
        Action = "s3:PutObject",
        Resource = "arn:aws:s3:::nimbus-security-project/*",
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          },
          "StringLike": {
            "s3:x-amz-server-side-encryption": "AES256"
          }
        }
      }
    ]
  })
}

