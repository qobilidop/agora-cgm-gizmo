#!/usr/bin/env bash
set -e

cd "$PROJECT_ROOT/data/sim"
for sim in cos-*/; do
    echo "Submitting $sim"
    (
        cd "$sim"
        sbatch sim-job.sh
    )
done
