#!/usr/bin/env bash
# qsub job/run.sh
#PBS -N cosmo_mech
#PBS -q condo
#PBS -l nodes=8:ppn=16:ib
#PBS -l walltime=8:00:00
#PBS -j oe
#PBS -o cosmo_mech.log
#PBS -d .
eval "$JOB_INIT"
date

export OMP_NUM_THREADS=2
if [[ -d output/restartfiles ]]; then
    restart_flag=1
else
    restart_flag=
fi

mpirun -v -machinefile "$PBS_NODEFILE" -x OMP_NUM_THREADS -npernode 8 ./GIZMO gizmo_params.txt "$restart_flag"

date
