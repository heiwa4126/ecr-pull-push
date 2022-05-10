#!/bin/sh -u

. ./account_dst.sh
. ./config.sh
ACCOUNT=$(aws sts get-caller-identity --query "Account" --output text)
DST_REGISTRY="$ACCOUNT.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
DST_REPO="$DST_REGISTRY/$REPO_NAME:latest"

aws ecr get-login-password |
  docker login --username AWS --password-stdin "$DST_REGISTRY"

docker push "$DST_REPO"
