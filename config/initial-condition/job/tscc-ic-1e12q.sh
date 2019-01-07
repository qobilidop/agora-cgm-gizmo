#!/usr/bin/env bash
#PBS -N ic-1e12q
#PBS -q condo
#PBS -l nodes=1:ppn=16
#PBS -l walltime=8:00:00
#PBS -j oe
#PBS -o tscc-ic-1e12q.log
#PBS -V
#PBS -d .
set -e
cd ..
echo "$PWD"

date
MUSIC 1e12q.conf
date
