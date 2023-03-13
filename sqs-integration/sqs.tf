# Create a SQS queue
resource "aws_sqs_queue" "sqs_s3_event_notification" {
  name   = "S3EventNotificationQueue"
  policy = data.aws_iam_policy_document.s3_send_to_sqs.json
}

# Create a policy document to allow S3 to send msg in the queue
data "aws_iam_policy_document" "s3_send_to_sqs" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
    actions   = ["SQS:SendMessage"]
    resources = [var.sqs_queue_resource_arn]
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.s3_bucket.arn]
    }
  }
}

# Create a variable that specify the SQS arn to avoid Cycle errors
# while creating the policy document and the SQS queue
variable "sqs_queue_resource_arn" { default = "arn:aws:sqs:*:*:S3EventNotificationQueue" }

# Output information about the SNS topic
output "sqs_queue_arn" { value = aws_sqs_queue.sqs_s3_event_notification.arn }
output "sqs_queue_policy" { value = data.aws_iam_policy_document.s3_send_to_sqs.json }