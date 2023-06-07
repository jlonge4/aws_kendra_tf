resource "aws_iam_policy" "my_policy" {
  name        = "my-kendra-policy"
  description = "IAM policy for Amazon Kendra"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "KendraPolicy",
      "Effect": "Allow",
      "Action": [
        "kendra:*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "S3Policy",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::wods-cf",
        "arn:aws:s3:::wods-cf/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role" "my_role" {
  name               = "my-kendra-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "kendra.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "my_policy_attachment" {
  role       = aws_iam_role.my_role.name
  policy_arn = aws_iam_policy.my_policy.arn
}
