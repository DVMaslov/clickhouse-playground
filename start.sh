#!/usr/bin/env bash
set -e

# create data directories with root ownership
sudo mkdir -p \
    volumes/clickhouse/node1 \
    volumes/clickhouse/node2 \
    volumes/clickhouse/node3 \
    volumes/clickhouse/node4 \
    volumes/zookeeper/data \
    volumes/zookeeper/datalog
sudo chown -R root:root volumes

# start cluster
sudo docker compose up -d
