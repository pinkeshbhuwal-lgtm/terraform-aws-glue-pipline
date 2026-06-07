resource "aws_glue_workflow" "workflow" {
  name = "etl-workflow"
}

resource "aws_glue_trigger" "start_job1" {

  name = "start-job1"

  type = "ON_DEMAND"

  workflow_name = aws_glue_workflow.workflow.name

  actions {
    job_name = aws_glue_job.job1.name
  }
}

resource "aws_glue_trigger" "job2_after_job1" {

  name = "job2-after-job1"

  type = "CONDITIONAL"

  workflow_name = aws_glue_workflow.workflow.name

  predicate {
    conditions {
      job_name = aws_glue_job.job1.name
      state    = "SUCCEEDED"
    }
  }

  actions {
    job_name = aws_glue_job.job2.name
  }
}
