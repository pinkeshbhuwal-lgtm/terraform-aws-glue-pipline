resource "aws_s3_bucket" "glue_bucket" {
  bucket = "${var.project_name}-scripts-001"
}
