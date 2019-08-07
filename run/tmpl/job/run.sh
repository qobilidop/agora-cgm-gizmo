#!/usr/bin/env bash
# qsub job/run.sh
#PBS -N {{ job.name }}
#PBS -q condo
#PBS -l nodes={{ job.nodes }}:ppn={{ job.mpi * job.omp }}:ib
#PBS -l walltime={{ job.hour }}:00:00
#PBS -j oe
#PBS -o {{ job.name }}.log
#PBS -d .
eval "$JOB_INIT"
date

export OMP_NUM_THREADS={{ job.omp }}
if [[ -d output/restartfiles ]]; then
    restart_flag=1
else
    restart_flag=
fi

mpirun -v -machinefile "$PBS_NODEFILE" -x OMP_NUM_THREADS -npernode {{ job.mpi }} ./GIZMO gizmo_params.txt "$restart_flag"

date
