# S3 Event Notifications

<h3>Description</h3>
<p>Develop AWS architectures for <strong>S3 event notifications</strong> with Lambda, SNS, and SQS using <strong>Terraform</strong>.<p>
<hr>

<h3>Architectures Developed</h3>
<table>
<thead>
  <tr>
    <th>Architecture</th>
    <th>Integrations</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>S3 Event Notification</td>
    <td>AWS Lambda Function</td>
  </tr>
  <tr>
    <td>S3 Event Notification</td>
    <td>AWS Simple Notification Service</td>
  </tr>
  <tr>
    <td>S3 Event Notification</td>
    <td>AWS Simple Queue Service</td>
  </tr>
  <tr>
    <td>S3 Event Notification</td>
    <td><a href="https://docs.aws.amazon.com/sns/latest/dg/sns-common-scenarios.html">Fanout Pattern</a></td>
  </tr>
</tbody>
</table>

<hr>
<h3>How to use</h3>
<table>
<thead>
  <tr>
    <th>Architecture</th>
    <th>Instructions</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>lambda-integration</td>
    <td>
      <ol>
        <li>
            Create the <a href="https://developer.hashicorp.com/terraform/cli/config/environment-variables">environment variables</a>
            specifying the <em>region_deployment</em> 
            and an AWS account's <em>access_key</em> and <em>secret_key</em>.
        </li>
        <li>
            Modify the deployment package according to your needs.
        </li>
        <li>
            Run <em>terraform init</em> -> <em>terraform plan</em> -> <em>terraform apply</em> from your terminal.
        </li>
      </ol>
    </td>
  </tr>
  <tr>
    <td>sns-integration</td>
    <td>
      <ol>
        <li>
            Create the <a href="https://developer.hashicorp.com/terraform/cli/config/environment-variables">environment variables</a>
            specifying the <em>region_deployment</em>, the <em>personal_email</em> endpoint
            and an AWS account's <em>access_key</em> and <em>secret_key</em>.
        </li>
        <li>
            Confirm the subscription to the SNS topic from the email account specified in the <em>personal_email</em> endpoint
        </li>
        <li>
            Run <em>terraform init</em> -> <em>terraform plan</em> -> <em>terraform apply</em> from your terminal.
        </li>
      </ol>
    </td>
  </tr>
  <tr>
    <td>sqs-integration</td>
    <td>
      <ol>
        <li>
            Create the <a href="https://developer.hashicorp.com/terraform/cli/config/environment-variables">environment variables</a>
            specifying the <em>region_deployment</em>, and an AWS account's <em>access_key</em> and <em>secret_key</em>.
        </li>
        <li>
            Run <em>terraform init</em> -> <em>terraform plan</em> -> <em>terraform apply</em> from your terminal.
        </li>
      </ol>
    </td>
  </tr>
  <tr>
    <td>fanout-pattern</td>
    <td>
      <ol>
        <li>
            Create the <a href="https://developer.hashicorp.com/terraform/cli/config/environment-variables">environment variables</a>
            specifying the <em>region_deployment</em>, and an AWS account's <em>access_key</em> and <em>secret_key</em>.
        </li>
        <li>
            Modify the SNS subscription filters inside the <em>sns.tf</em> script according to your needs.
        </li>
        <li>
            Run <em>terraform init</em> -> <em>terraform plan</em> -> <em>terraform apply</em> from your terminal.
        </li>
      </ol>
    </td>
  </tr>
</tbody>
</table>

<hr>
<h3>References</h3>
<table>
<thead>
  <tr>
    <th>References</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>
      <a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/how-to-enable-disable-notification-intro.html" target="_blank" rel="noopener noreferrer">Enable S3 event notifications</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket" target="_blank" rel="noopener noreferrer">Create a S3 bucket using Terraform</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification" target="_blank" rel="noopener noreferrer">Create S3 event notifications using Terraform</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://docs.aws.amazon.com/lambda/latest/dg/with-s3-example.html" target="_blank" rel="noopener noreferrer">Tutorial: using an Amazon S3 trigger to invoke a Lambda function</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html" target="_blank" rel="noopener noreferrer">Define Lambda function's role</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function" target="_blank" rel="noopener noreferrer">Define a Lambda function using Terraform</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission" target="_blank" rel="noopener noreferrer">Define Lambda function's permissions using Terraform</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://docs.aws.amazon.com/lambda/latest/dg/API_CreateFunction.html#SSS-CreateFunction-request-Runtime" target="_blank" rel="noopener noreferrer">Working with Lambda functions, developer reference</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic" target="_blank" rel="noopener noreferrer">Create an SNS topic using Terraform</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/ways-to-add-notification-config-to-bucket.html" target="_blank" rel="noopener noreferrer">Configuring a bucket for notifications</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://developer.hashicorp.com/terraform/tutorials/aws/aws-iam-policy" target="_blank" rel="noopener noreferrer">Create an IAM policy document using Terraform</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription" target="_blank" rel="noopener noreferrer">Create a SNS topic subscription using Terraform</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue" target="_blank" rel="noopener noreferrer">Create a SQS using Terraform</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-message-filtering.html" target="_blank" rel="noopener noreferrer">SNS message filtering</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://noise.getoto.net/2022/11/22/introducing-payload-based-message-filtering-for-amazon-sns/" target="_blank" rel="noopener noreferrer">Create SNS message filters for S3 event notifications</a>
    </td>
  </tr>
</tbody>
</table>
