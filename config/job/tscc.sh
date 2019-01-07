#!/usr/bin/env bash
#PBS -q condo
#PBS -l nodes=1:ppn=16
#PBS -l walltime=8:00:00
#PBS -j oe
#PBS -o tscc.log
#PBS -V
#PBS -d .
set -e
cd ..
echo "$PWD"

date
export OMP_NUM_THREADS=1
ntasks=$((16/$OMP_NUM_THREADS))
opts="-v -machinefile $PBS_NODEFILE -npernode $ntasks -x LD_LIBRARY_PATH"
run_gizmo="mpirun $opts ./GIZMO params.txt"
if [ -d output/restartfiles ]; then
    $run_gizmo 1
else
    $run_gizmo
fi
date
