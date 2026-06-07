output "workflow_name" {
  value = aws_glue_workflow.workflow.name

}

output "job1name"{
  value = aws_glue_job.job1.name

}

output "job2name"{
  value =aws_glue_job.job2.name
}
