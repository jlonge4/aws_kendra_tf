resource "aws_kendra_index" "test-index" {
  name = "my-index"
  description = "Testing Index"
  role_arn = aws_iam_role.my_role.arn
}

resource "aws_kendra_data_source" "kendra-s3-connector" {
index_id = aws_kendra_index.test-index.id
name     = "example"
type     = "S3"
role_arn = aws_iam_role.my_role.arn

  configuration {
    s3_configuration {
      bucket_name = aws_s3_bucket.kendra-bucket.id
    }
  }
}







