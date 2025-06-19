#!/bin/bash

set -e
set -u

function create_bucket() {
	echo "  Creating bucket '$bucket'"
    influx bucket create \
        -n "${bucket}" \
        -o "${DOCKER_INFLUXDB_INIT_ORG}" \
        -r "${DOCKER_INFLUXDB_INIT_RETENTION}"
}

if [ -n "$INFLUXDB_BUCKETS" ]; then
	echo "Multiple buckets creation requested: $INFLUXDB_BUCKETS"
	for bucket in $(echo "$INFLUXDB_BUCKETS" | tr ',' ' '); do
		create_bucket "$bucket"
	done
	echo "Multiple buckets created"
fi