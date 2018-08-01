#!/usr/bin/env bash
#PBS -N make-ic
#PBS -q condo
#PBS -l nodes=1:ppn=16
#PBS -l walltime=1:00:00
#PBS -V
#PBS -j oe
#PBS -o make-ic.log

cd "$REPO_DIR"
source env/activate

cd data/ic
make all
