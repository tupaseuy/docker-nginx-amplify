#!/bin/bash
BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p' | sed 's/.*\///g')
COMMIT="$(git log -1 --pretty=format:'%h')"
NAME=139024385955.dkr.ecr.us-east-1.amazonaws.com/docker-nginx-amplify
IMG=$NAME:$BRANCH
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t $IMG .
docker tag $IMG $NAME:latest
docker tag $IMG $NAME:$COMMIT
docker push $NAME