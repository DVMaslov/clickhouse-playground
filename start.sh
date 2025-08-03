#!/usr/bin/env bash
set -e

set -o allexport
[ -f .env ] && source .env
set +o allexport

VOLUMES_DIR=${VOLUMES_DIR:-./volumes}
CLICKHOUSE_NODES=(node1 node2 node3 node4)

# create data directories with appropriate ownership
for node in "${CLICKHOUSE_NODES[@]}"; do
    mkdir -p "${VOLUMES_DIR}/clickhouse/${node}"
done
mkdir -p "${VOLUMES_DIR}/zookeeper/data" "${VOLUMES_DIR}/zookeeper/datalog"

# start cluster
docker compose up -d
