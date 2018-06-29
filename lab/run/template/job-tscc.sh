#!/usr/bin/env bash
#PBS -N {sim_name}
#PBS -q condo
#PBS -l nodes=1:ppn=16
#PBS -l walltime=8:00:00
#PBS -V

source "$PROJECT_ROOT/code/config/tscc/activate.sh"

cd "$PROJECT_ROOT/lab/run/{sim_name}"
RUN="mpirun -machinefile $PBS_NODEFILE -np $PBS_NP ./GIZMO params.txt"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
