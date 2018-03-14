#!/bin/bash
set -x -e

# Get type of node
ROLE=$(/usr/share/google/get_metadata_value attributes/dataproc-role)

if [[ "${ROLE}" == 'Master' ]]; then
    # Create hive tables
    hive -f gs://5spoc-benchmark-data/schema.hql
fi