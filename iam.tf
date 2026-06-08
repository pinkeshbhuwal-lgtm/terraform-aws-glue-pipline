resource "aws_iam_role" "glue_role" {

  name = "${var.project_name}-glue-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "glue.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "glue_service_role" {

  role = aws_iam_role.glue_role.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_policy" "glue_s3_policy" {

  name = "${var.project_name}-glue-s3-policy"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Action = [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ]

      Resource = [
        aws_s3_bucket.glue_bucket.arn,
        "${aws_s3_bucket.glue_bucket.arn}/*"
      ]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "glue_s3_attach" {

  role = aws_iam_role.glue_role.name

  policy_arn = aws_iam_policy.glue_s3_policy.arn
}
