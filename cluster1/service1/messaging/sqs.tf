resource "aws_sqs_queue" "capacity-job-service1" {
  name                       = "capacity-job-service1"
  delay_seconds              = 0
  max_message_size           = 256000
  message_retention_seconds  = 345600
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 600

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.capacity-service1-dlq.arn
    maxReceiveCount     = 1
  })

  tags = {
    Env = var.env
  }
}

resource "aws_sqs_queue" "capacity-service1-dlq" {
  name                       = "capacity-service1-dlq"
  delay_seconds              = 0
  max_message_size           = 256000
  message_retention_seconds  = 345600
  receive_wait_time_seconds  = 10

  tags = {
    Env = var.env
  }
}

resource "aws_sqs_queue_policy" "capacity-job-service1" {
  queue_url = aws_sqs_queue.capacity-job-service1.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.capacity-job-service1.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.capacity-job.arn}"
        }
      }
    }
  ]
}
POLICY
}


resource "aws_sqs_queue" "datasource-persistence-service1" {
  name = "datasource-persistence-service1"
  delay_seconds = 0
  max_message_size           = 256000
  message_retention_seconds  = 345600
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 600

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.datasource-persistence-service1-dlq.arn
    maxReceiveCount     = 1
  })

  tags = {
    Env = var.env
  }
}

resource "aws_sqs_queue" "datasource-persistence-service1-dlq" {
  name                       = "datasource-persistence-service1-dlq"
  delay_seconds              = 0
  max_message_size           = 256000
  message_retention_seconds  = 345600
  receive_wait_time_seconds  = 10

  tags = {
    Env = var.env
  }
}

resource "aws_sqs_queue_policy" "datasource-persistence-service1" {
  queue_url = aws_sqs_queue.datasource-persistence-service1.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.datasource-persistence-service1.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.datasource-persistence.arn}"
        }
      }
    }
  ]
}
POLICY
}

