resource "aws_s3_bucket" "glue_bucket" {
  bucket = "${var.project_name}-scripts-001"
}

resource "aws_s3_object" "job1_script" {

  bucket = aws_s3_bucket.glue_bucket.id

  key = "scripts/job1.py"

  source = "glue-scripts/job1.py"

  etag = filemd5("glue-scripts/job1.py")
}

resource "aws_s3_object" "job2_script" {

  bucket = aws_s3_bucket.glue_bucket.id

  key = "scripts/job2.py"

  source = "glue-scripts/job2.py"

  etag = filemd5("glue-scripts/job2.py")
}
