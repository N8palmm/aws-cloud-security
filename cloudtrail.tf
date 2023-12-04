resource "aws_cloudtrail" "example_trail" {
  name                          = "example_trail"
  s3_bucket_name                = aws_s3_bucket.example_bucket.id  # Corrected to match your s3.tf
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true

  # ... any other configurations ...
}

