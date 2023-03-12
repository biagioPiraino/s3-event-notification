# Create a SNS topic
resource "aws_sns_topic" "sns_s3_event_notification" {
  name   = "S3EventNotificationTopic"
  policy = data.aws_iam_policy_document.s3_publish_to_sns.json
}

# Create a policy document to allow S3 to publish msg in the topic
data "aws_iam_policy_document" "s3_publish_to_sns" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
    actions   = ["SNS:Publish"]
    resources = [var.sns_topic_resource_arn]
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.s3_bucket.arn]
    }
  }
}

# Create a variable that specify the SNS topic arn to avoid Cycle errors
# while creating the policy document and the SNS topic
variable "sns_topic_resource_arn" { default = "arn:aws:sns:*:*:S3EventNotificationTopic" }

# Create a subscription to the SNS topic with your personal email
resource "aws_sns_topic_subscription" "sns_topic_personal_sub" {
  topic_arn = aws_sns_topic.sns_s3_event_notification.arn
  protocol  = "email"
  endpoint  = var.personal_email
}

# Reference an environment variable with you personal email
variable "personal_email" {}

# Output information about the SNS topic
output "sns_topic_arn" { value = aws_sns_topic.sns_s3_event_notification.arn }
output "sns_topic_policy" { value = data.aws_iam_policy_document.s3_publish_to_sns.json }
output "personal_email_endpoint" { value = var.personal_email }