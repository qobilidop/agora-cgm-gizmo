#!/usr/bin/env bash
#PBS -N plot-sfh
#PBS -q condo
#PBS -l nodes=1:ppn=4
#PBS -l walltime=1:00:00
#PBS -V
#PBS -j oe
#PBS -o plot-sfh.log

cd "$REPO_DIR"
source env/activate

plot-sfh.py
