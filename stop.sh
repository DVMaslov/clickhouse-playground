#!/usr/bin/env bash
set -e

set -o allexport
[ -f .env ] && source .env
set +o allexport

# stop cluster
docker compose down
