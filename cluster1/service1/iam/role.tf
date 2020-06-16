resource "aws_iam_role" "service1-ecs-role" {
  name = "service1-ecs-role"

  assume_role_policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ecs-tasks.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
EOF
}

resource "aws_iam_policy" "service1-ecs-policy" {
  name = "service1-ecs-policy"

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
           "sts:*"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
           "sns:*"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
           "sqs:*"
        ],
        "Resource": "*",
        "Effect": "Allow"
      }
    ]
  }
EOF
}

resource "aws_iam_role_policy_attachment" "service1-ecs-tf" {
  role       = "${aws_iam_role.service1-ecs-role.name}"
  policy_arn = "${aws_iam_policy.service1-ecs-policy.arn}"
}

