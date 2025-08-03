#!/usr/bin/env bash
set -e

set -o allexport
[ -f .env ] && source .env
set +o allexport

VOLUMES_DIR=${VOLUMES_DIR:-./volumes}
CLICKHOUSE_NODES=(node1 node2 node3 node4)

# create data directories with root ownership
for node in "${CLICKHOUSE_NODES[@]}"; do
    sudo mkdir -p "${VOLUMES_DIR}/clickhouse/${node}"
done
sudo mkdir -p "${VOLUMES_DIR}/zookeeper/data" "${VOLUMES_DIR}/zookeeper/datalog"
sudo chown -R root:root "${VOLUMES_DIR}"

# start cluster
sudo docker compose up -d
