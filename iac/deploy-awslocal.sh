#!/bin/bash
docker compose --project-directory ../build exec localstackcli awslocal s3api create-bucket \
    --bucket localstack-s3 \
    --region us-east-1

docker compose --project-directory ../build exec localstackcli awslocal sqs create-queue \
    --queue-name localstack-s3-events \
    --region us-east-1

docker compose --project-directory ../build exec localstackcli awslocal s3api put-bucket-notification-configuration \
  --bucket localstack-s3 \
  --notification-configuration file://policies/notifications.json
