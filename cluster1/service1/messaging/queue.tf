resource "aws_sns_topic_subscription" "capacity-job" {
  topic_arn            = aws_sns_topic.capacity-job.arn
  protocol             = "sqs"
  endpoint             = aws_sqs_queue.capacity-job-service1.arn
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "datasource-persistence" {
  topic_arn            = aws_sns_topic.datasource-persistence.arn
  protocol             = "sqs"
  endpoint             = aws_sqs_queue.datasource-persistence-service1.arn
  raw_message_delivery = true
}
