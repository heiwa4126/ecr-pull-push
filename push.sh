#!/bin/sh

. ./account_dst.sh

aws ecr get-login-password --region ap-northeast-1 \
  | docker login --username AWS --password-stdin 577370749203.dkr.ecr.ap-northeast-1.amazonaws.com

docker push 577370749203.dkr.ecr.ap-northeast-1.amazonaws.com/bo-container:latest
