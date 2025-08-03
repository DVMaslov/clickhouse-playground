#!/usr/bin/env bash
set -e

set -o allexport
[ -f .env ] && source .env
set +o allexport

VOLUMES_DIR=${VOLUMES_DIR:-./volumes}
CLICKHOUSE_NODES=(node1 node2 node3 node4)

# Requires permission to run Docker commands.
# Ensure your user is in the 'docker' group or that you are using rootless Docker.

# determine container UIDs/GIDs
CH_UID=$(docker run --rm "${CH_IMAGE}:${CH_VERSION}" id -u)
CH_GID=$(docker run --rm "${CH_IMAGE}:${CH_VERSION}" id -g)
ZK_UID=$(docker run --rm "${ZK_IMAGE}:${ZK_VERSION}" id -u)
ZK_GID=$(docker run --rm "${ZK_IMAGE}:${ZK_VERSION}" id -g)

# create data directories with appropriate ownership
for node in "${CLICKHOUSE_NODES[@]}"; do
    mkdir -p "${VOLUMES_DIR}/clickhouse/${node}"
done
mkdir -p "${VOLUMES_DIR}/zookeeper/data" "${VOLUMES_DIR}/zookeeper/datalog"

chown -R "${CH_UID}:${CH_GID}" "${VOLUMES_DIR}/clickhouse"
chown -R "${ZK_UID}:${ZK_GID}" "${VOLUMES_DIR}/zookeeper"

# start cluster
docker compose up -d
