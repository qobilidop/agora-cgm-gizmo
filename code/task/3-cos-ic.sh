#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
sbatch 4-cos-ic.job
