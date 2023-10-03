output "bucket_name" {
  value = aws_s3_bucket.website_bucket.bucket
}

output "website_endpoint" {
  description = "Bucket name for our static website hosting"
  value = aws_s3_bucket_website_configuration.web_configuration.website_endpoint
}