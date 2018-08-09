#!/usr/bin/env bash
set -e

cd "$PROJECT_ROOT/data/sim"
for sim in cosmological-*/; do
    echo "Submitting $sim"
    (
        cd "$sim"
        sbatch sim-job.sh
    )
done
