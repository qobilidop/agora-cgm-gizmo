#!/usr/bin/env bash
set -e

cd "$REPO_DIR/data/ic"
sbatch edison-job.sh
