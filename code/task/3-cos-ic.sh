#!/usr/bin/env bash
set -e

cd "$PROJECT_ROOT/data/ic"
sbatch edison-job.sh
