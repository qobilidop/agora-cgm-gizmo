#!/usr/bin/env bash
#SBATCH -J ic-1e12q
#SBATCH -q regular
#SBATCH -N 1
#SBATCH -t 01:00:00
#SBATCH -o ic-1e12q.log
#SBATCH -L SCRATCH
#SBATCH --export=ALL
#SBATCH -D .
set -e
cd ..
echo "$PWD"

date
MUSIC 1e12q.conf
date
