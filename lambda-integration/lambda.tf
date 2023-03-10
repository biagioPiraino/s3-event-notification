# Create a lambda function
resource "aws_lambda_function" "lambda_function" {
  function_name = "perform_s3_event_notification"
  role          = aws_iam_role.lambda_assume_role.arn
  filename      = "lambda_function_s3_notification.zip"
  description   = "Perform lambda operation when an S3 event notification is triggered."
  timeout       = 60
  runtime       = "python3.9"
  # The name of the method within your code that lambda calls to run your function
  # Required if the deployment package is a .zip file archive.
  handler      = "lambdafunction.LambdaHandler"
  package_type = "Zip"
}

# Create an IAM Policy Document with an sts:AssumeRole action
data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# Create an IAM Role to attach to the lambda function
resource "aws_iam_role" "lambda_assume_role" {
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
  name               = "lambda_assume_role"
  description        = "Grants the function the permission to access AWS services and resources."
}

# Allow bucket to Invoke the function
resource "aws_lambda_permission" "allow_bucket_to_invoke" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.s3_bucket.arn
  statement_id  = "AllowS3ToInvokeFunction"
}

# Output information about the lambda function
output "lambda_arn" { value = aws_lambda_function.lambda_function.arn }
output "lambda_function_name" { value = aws_lambda_function.lambda_function.function_name }