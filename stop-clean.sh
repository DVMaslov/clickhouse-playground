#!/usr/bin/env bash
set -e

set -o allexport
[ -f .env ] && source .env
set +o allexport

VOLUMES_DIR=${VOLUMES_DIR:-./volumes}

# stop cluster and remove containers, networks, and volumes
docker compose down -v

# remove data directories if they exist and path is safe
if [[ -n "$VOLUMES_DIR" && "$VOLUMES_DIR" != "/" ]]; then
    rm -rf -- "$VOLUMES_DIR"
fi
