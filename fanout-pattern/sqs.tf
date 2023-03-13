# Create a SQS queue for the notifications related to images
resource "aws_sqs_queue" "sqs_image_s3_event_notification" {
  name   = "S3ImageEventNotificationQueue"
  policy = data.aws_iam_policy_document.sns_send_image_notification_to_sqs.json
}

# Create a policy document for the image queue
data "aws_iam_policy_document" "sns_send_image_notification_to_sqs" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }
    actions   = ["SQS:SendMessage"]
    resources = [var.sqs_image_queue_resource_arn]
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_sns_topic.sns_s3_event_notification.arn]
    }
  }
}

# Create a variable that specify the SQS arn to avoid cycle errors
# while creating the policy document and the SQS queue
variable "sqs_image_queue_resource_arn" { default = "arn:aws:sqs:*:*:S3ImageEventNotificationQueue" }

# Create a SQS queue for the notifications related to text files
resource "aws_sqs_queue" "sqs_text_s3_event_notification" {
  name   = "S3TextEventNotificationQueue"
  policy = data.aws_iam_policy_document.sns_send_text_notification_to_sqs.json
}

# Create a policy document for the text queue
data "aws_iam_policy_document" "sns_send_text_notification_to_sqs" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }
    actions   = ["SQS:SendMessage"]
    resources = [var.sqs_text_queue_resource_arn]
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_sns_topic.sns_s3_event_notification.arn]
    }
  }
}

# Create a variable that specify the SQS arn to avoid cycle errors
# while creating the policy document and the SQS queue
variable "sqs_text_queue_resource_arn" { default = "arn:aws:sqs:*:*:S3TextEventNotificationQueue" }

# Output information about the queues
output "sqs_image_queue_arn" { value = aws_sqs_queue.sqs_image_s3_event_notification.arn }
output "sqs_image_queue_policy" { value = data.aws_iam_policy_document.sns_send_image_notification_to_sqs.json }
output "sqs_text_queue_arn" { value = aws_sqs_queue.sqs_text_s3_event_notification.arn }
output "sqs_text_queue_policy" { value = data.aws_iam_policy_document.sns_send_text_notification_to_sqs.json }