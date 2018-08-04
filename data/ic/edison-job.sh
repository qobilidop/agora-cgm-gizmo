#!/usr/bin/env bash
#SBATCH -J cos-ic
#SBATCH -q regular
#SBATCH -N 1
#SBATCH -t 01:00:00
#SBATCH --export=ALL
#SBATCH -o edison-job.log
#SBATCH -L SCRATCH
set -e

cd "$REPO_DIR"
source env/activate

cd data/ic
make all
