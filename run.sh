#!/usr/bin/env bash

docker run -ti --rm -v `pwd`:/content -p 8080:8080 \
    -e CONTENT_URL_PREFIX='file:///content' \
    -e WORKSHOPS_URLS='file:///content/_workshops/paris.yml' \
    docker.io/osevg/workshopper
