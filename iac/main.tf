terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
}

# Point 1: Create S3 bucket
resource "aws_s3_bucket" "localstack_assets" {
  bucket = "localstack-s3"
}

# Point 2: Create SQS 

resource "aws_sqs_queue" "localstack_queue" {
  name                        = "localstack-s3-events"
  fifo_queue                  = false
}

# Point 3: Create an S3 event notification policy that sends a message to the SQS Queue when a file is added to the S3 Bucket

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.localstack_assets.id
  queue {
    queue_arn = aws_sqs_queue.localstack_queue.arn
    events = ["s3:ObjectCreated:*"]
  }
  depends_on = [aws_sqs_queue.localstack_queue]

}