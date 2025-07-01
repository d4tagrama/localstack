#!/bin/bash
docker compose --project-directory ../build exec localstackcli tflocal init
if [ $? -eq 0 ]; then
  echo "tflocal init is completed..."
else
  echo "Issues during tflocal init"
  exit 1
fi

docker compose --project-directory ../build exec localstackcli tflocal apply --auto-approve
if [ $? -eq 0 ]; then
  echo "Creating infrastructure..."
else
  echo "Something went wrong!!!"
  exit 1
fi