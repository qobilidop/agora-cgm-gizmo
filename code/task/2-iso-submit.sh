#!/usr/bin/env bash
set -e

cd "$REPO_DIR/data/sim"
for sim in isolated-*/; do
    echo "Submitting $sim"
    (
        cd "$sim"
        qsub sim-job.sh
    )
done
