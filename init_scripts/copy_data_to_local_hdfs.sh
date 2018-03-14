#!/bin/bash
set -x -e

# Get type of node
ROLE=$(/usr/share/google/get_metadata_value attributes/dataproc-role)

if [[ "${ROLE}" == 'Master' ]]; then
    # Copy data from google storage to cluster's hdfs
    hadoop distcp gs://5spoc-benchmark-data/orc/ /
    hadoop distcp gs://5spoc-benchmark-data/parquet/ /
fi