#!/bin/sh

. ./account_dst.sh
# regionは↑の環境変数に従う

. ./config.sh

if aws ecr describe-repositories --repository-names "$REPO_NAME" >/dev/null 2>&1; then
  echo "Repositoy \"$REPO_NAME\" already exists."
else
  echo "Repositoy \"$REPO_NAME\" does not exist. Now creating \"$REPO_NAME\"..."
  aws ecr create-repository \
    --image-scanning-configuration scanOnPush=true \
    --repository-name "$REPO_NAME"
fi
