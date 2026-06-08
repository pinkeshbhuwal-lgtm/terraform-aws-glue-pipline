resource "aws_glue_job" "job1" {

  name = "job1"

  role_arn = aws_iam_role.glue_role.arn

  glue_version = "4.0"

  worker_type = "G.1X"

  number_of_workers = 2

  command {

    name = "glueetl"

    script_location =
      "s3://${aws_s3_bucket.glue_bucket.bucket}/scripts/job1.py"

    python_version = "3"
  }
}

resource "aws_glue_job" "job2" {

  name = "job2"

  role_arn = aws_iam_role.glue_role.arn

  glue_version = "4.0"

  worker_type = "G.1X"

  number_of_workers = 2

  command {

    name = "glueetl"

    script_location =
      "s3://${aws_s3_bucket.glue_bucket.bucket}/scripts/job2.py"

    python_version = "3"
  }
}
