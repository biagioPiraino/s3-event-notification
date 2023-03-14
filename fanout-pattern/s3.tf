# Create an S3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket        = "unique-s3-notification-bucket"
  force_destroy = true
}

# Enable versioning on the bucket
resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration { status = "Enabled" }
}

# Define events when trigger notifications
variable "events_notifications" {
  default = [
    "s3:ObjectCreated:Put",
    "s3:ObjectCreated:Post",
    "s3:ObjectCreated:Copy",
    "s3:ObjectRemoved:Delete"
  ]
}

# Add notification configuration for an SNS topic
resource "aws_s3_bucket_notification" "s3_bucket_notification" {
  bucket = aws_s3_bucket.s3_bucket.id
  topic {
    topic_arn = aws_sns_topic.sns_s3_event_notification.arn
    events    = var.events_notifications
  }
}

# Output information about the bucket
output "s3_bucket_id" { value = aws_s3_bucket.s3_bucket.id }
output "s3_bucket_arn" { value = aws_s3_bucket.s3_bucket.arn }