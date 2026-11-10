#!/bin/sh
set -eu

docker run --rm -p 8080:8080 \
  -e 'URLS=[{"url":"/openapi.yaml","name":"API v1"},{"url":"/openapi-v2.yaml","name":"API v2 (beta)"}]' \
  -e 'URLS_PRIMARY_NAME=API v1' \
  --mount "type=bind,source=$(pwd)/openapi.yaml,target=/usr/share/nginx/html/openapi.yaml,readonly" \
  --mount "type=bind,source=$(pwd)/openapi-v2.yaml,target=/usr/share/nginx/html/openapi-v2.yaml,readonly" \
  swaggerapi/swagger-ui
