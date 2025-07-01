docker compose --project-directory ../build exec localstackcli awslocal s3 rb \
  s3://localstack-s3 \
  --force \
  --region us-east-1

Q_URL=$(docker compose --project-directory ../build exec localstackcli awslocal sqs get-queue-url \
  --queue-name localstack-s3-events \
  --region us-east-1 \
  --output text)

docker compose --project-directory ../build exec localstackcli awslocal sqs delete-queue \
  --queue-url "$Q_URL" \
  --region us-east-1