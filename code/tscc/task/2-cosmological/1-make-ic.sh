#!/usr/bin/env bash
set -e

cd "$REPO_DIR/code/tscc/job"
qsub make-ic.sh
