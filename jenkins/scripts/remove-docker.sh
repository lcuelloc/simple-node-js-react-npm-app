#!/usr/bin/env sh

echo 'The following command delete docker previous container'

docker ps -f name=node-server -q | xargs --no-run-if-empty docker container stop
docker container ls -a -f name=node-server -q | xargs -r docker container rm
