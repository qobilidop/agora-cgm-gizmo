#!/usr/bin/env bash
#PBS -N 1e12q-lv12
#PBS -q condo
#PBS -l nodes=1:ppn=16
#PBS -l walltime=8:00:00
#PBS -j oe
#PBS -o 1e12q-lv12-tscc.log
#PBS -V
#PBS -d .
set -e
cd ..
echo "$PWD"
source gizenv-activate.sh

date
MUSIC 1e12q-lv12.conf
date
