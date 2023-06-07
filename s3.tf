resource "aws_s3_bucket" "kendra-bucket" {
  bucket = "kendra-index-bucket"

  tags = {
    Name        = "TF bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "kendra-bucket-acl" {
  bucket = aws_s3_bucket.kendra-bucket.id
  acl    = "private"
}