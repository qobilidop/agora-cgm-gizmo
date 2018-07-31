#!/usr/bin/env bash
set -e

cd "$REPO_DIR/data/ic"
qsub tscc-job.sh
