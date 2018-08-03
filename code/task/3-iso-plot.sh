#!/usr/bin/env bash
set -e

cd "$REPO_DIR/code/tscc/job"
qsub plot-sfh.sh
