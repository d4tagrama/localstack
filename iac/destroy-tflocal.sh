#!/bin/bash
docker compose --project-directory ../build exec localstackcli tflocal destroy --auto-approve
if [ $? -eq 0 ]; then
  echo "tflocal init is completed..."
else
  echo "Issues during tflocal init"
  exit 1
fi

