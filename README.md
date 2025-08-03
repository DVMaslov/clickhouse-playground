# ClickHouse Playground

This project spins up a four-node ClickHouse cluster (two shards, two replicas) with a single Zookeeper instance and HAProxy load balancer. It is intended for quick experimentation on macOS or Linux.

## Requirements
- Docker with Docker Compose plugin
- Access to the `docker` command (e.g., your user is in the `docker` group or you are using rootless Docker)

## Usage
Run the provided script to create required directories and start the cluster:

```bash
./start.sh
```

HAProxy exposes the cluster on the host:

- Native protocol: `localhost:9000`
- HTTP interface: `http://localhost:8120`

Individual nodes are mapped for debugging:

- ch1: ports 9001/8121
- ch2: ports 9002/8122
- ch3: ports 9003/8123
- ch4: ports 9004/8124

To stop the cluster without deleting data, run:

```bash
./stop.sh
```

To stop the cluster and remove all created data, run:

```bash
./stop-clean.sh
```
