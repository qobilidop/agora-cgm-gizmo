#!/usr/bin/env bash
#PBS -N {sim_name}
#PBS -q condo
#PBS -l nodes=1:ppn=16
#PBS -l walltime=8:00:00
#PBS -V
#PBS -j oe
#PBS -o {sim_name}.log

cd "$PROJECT_DIR"
source env/activate

cd "data/sim/{sim_name}"
RUN="mpirun -machinefile $PBS_NODEFILE -np $PBS_NP {sim_gizmo_bin} {sim_gizmo_params}"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
