resource "aws_sns_topic" "capacity-job" {
  name = "capacity-job"
}

resource "aws_sns_topic" "datasource-persistence" {
  name = "datasource-persistence"
}

