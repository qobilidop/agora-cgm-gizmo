#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
qsub script/tscc-job-make-ic.sh
