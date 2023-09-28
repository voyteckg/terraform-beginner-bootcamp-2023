#https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length = 32
  special = false
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
  # Bucket Naming rules
  #https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console
  tags = {
    UserUuid = var.user_uuid
  }
}