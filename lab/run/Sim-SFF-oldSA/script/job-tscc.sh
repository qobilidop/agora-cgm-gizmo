#!/usr/bin/env bash
#PBS -N Sim-SFF-oldSA
#PBS -q condo
#PBS -l nodes=1:ppn=16
#PBS -l walltime=8:00:00
#PBS -V

source "$PROJECT_DIR/code/config/tscc/init.sh"

cd "$PROJECT_DIR/lab/run/Sim-SFF-oldSA"
RUN="mpirun -machinefile $PBS_NODEFILE -np $PBS_NP ./GIZMO params.txt"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
