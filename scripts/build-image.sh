#!/bin/sh

tag=$(./scripts/getCurrentVersion.sh)

# https://developer.rocket.chat/v1/docs/linux
docker build  -f scripts/Dockerfile -t akrasnov87/rocket.chat:$tag . --no-cache