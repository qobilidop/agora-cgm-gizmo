#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
cd script
qsub tscc-job-make-ic.sh
