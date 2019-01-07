#!/usr/bin/env bash
set -e

cd "$PROJECT_ROOT"
source env/activate

cd pipeline/job
sbatch edison-job.sh


