resource "aws_iam_role" "glue_role" {
  name = "${var.project_name}-glue-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-10"

    Statement = [{
      Effect = "Allow" 

      Principle = {
        Service = "glue.amazonaws.com"
    }

      Action = "sts:AssumeRole"


    }]
  }

  )

}
