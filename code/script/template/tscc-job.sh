#!/usr/bin/env bash
#PBS -N {sim_name}
#PBS -q condo
#PBS -l nodes=1:ppn=16
#PBS -l walltime=8:00:00
#PBS -V
#PBS -j oe
#PBS -o tscc-job.log

cd "$REPO_DIR"
source env/activate

cd "data/sim/{sim_name}"
RUN="mpirun -v -machinefile $PBS_NODEFILE -np $PBS_NP GIZMO-{gizmo_config} params.txt"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
