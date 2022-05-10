#!/bin/sh -u

. ./account_src.sh
. ./config.sh

ACCOUNT=$(aws sts get-caller-identity --query "Account" --output text)
SRC_REGISTRY="$ACCOUNT.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
SRC_REPO="$SRC_REGISTRY/$REPO_NAME:$TAG"

aws ecr get-login-password --region ap-northeast-1 |
  docker login --username AWS --password-stdin "$SRC_REGISTRY"

docker pull "$SRC_REPO"
