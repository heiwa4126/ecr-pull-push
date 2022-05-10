#!/bin/sh -u

. ./account_src.sh
. ./config.sh

ACCOUNT=$(aws sts get-caller-identity --query "Account" --output text)
SRC_REGISTRY="$ACCOUNT.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
SRC_REPO="$SRC_REGISTRY/$REPO_NAME:$TAG"

. ./account_dst.sh
ACCOUNT=$(aws sts get-caller-identity --query "Account" --output text)
DST_REGISTRY="$ACCOUNT.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
DST_REPO="$DST_REGISTRY/$REPO_NAME:$TAG"

docker rmi "$SRC_REPO"
docker rmi "$DST_REPO"
