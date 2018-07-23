#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
for job in script/sim/*/job-tscc.sh; do
    qsub "$job"
done
