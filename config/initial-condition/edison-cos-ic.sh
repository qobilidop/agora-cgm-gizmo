#!/usr/bin/env bash
#SBATCH -J cos-ic
#SBATCH -q regular
#SBATCH -N 1
#SBATCH -t 01:00:00
#SBATCH --export=ALL
#SBATCH -o edison-cos-ic.log
#SBATCH -L SCRATCH
set -e

cd "$PROJECT_ROOT"
source env/activate

cd data/ic
MUSIC "$PROJECT_ROOT"/config/ic/1e12q.conf
