#!/bin/bash
docker compose up -d && docker compose logs -f localstack >> localstack.log 2>&1 &

if [ $? -eq 0 ]; then
  echo "Localstack is up..."
else
  echo "Localstack failed to start."
  exit 1
fi
