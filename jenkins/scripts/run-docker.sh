#!/usr/bin/env sh

echo 'The following command run docker container'

docker inspect -f . node:6-alpine
docker pull node:6-alpine
docker run -p 3000:3000 --name node-server node:6-alpine
