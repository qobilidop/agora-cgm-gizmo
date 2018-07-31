#!/usr/bin/env bash
set -e

cd "$REPO_DIR/data/sim"
for sim in cosmological-*/; do
    echo "Submitting $sim"
    (
        cd "$sim"
        qsub tscc-job.sh
    )
done
