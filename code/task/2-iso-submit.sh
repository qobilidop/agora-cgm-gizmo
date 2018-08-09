#!/usr/bin/env bash
set -e

cd "$PROJECT_ROOT/data/sim"
for sim in isolated-*/; do
    echo "Submitting $sim"
    (
        cd "$sim"
        qsub sim-job.sh
    )
done
