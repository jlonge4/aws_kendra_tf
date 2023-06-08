resource "aws_s3_bucket" "kendra-bucket" {
  bucket = "kendra-test-bucket-001"

  tags = {
    Name        = "TF bucket"
    Environment = "Sbx"
  }
}
