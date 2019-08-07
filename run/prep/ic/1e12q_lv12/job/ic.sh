#!/usr/bin/env bash
# qsub job/ic.sh
#PBS -N 1e12q_lv12
#PBS -q condo
#PBS -l nodes=1:ppn=16
#PBS -l walltime=8:00:00
#PBS -j oe
#PBS -o 1e12q_lv12.log
#PBS -d .
eval "$JOB_INIT"
date

MUSIC music.conf

date
