#!/usr/bin/env bash
#PBS -N {sim_name}
#PBS -q condo
#PBS -l nodes={sim_job_nodes}:ppn=16
#PBS -l walltime=8:00:00
#PBS -V
#PBS -j oe
#PBS -o sim-job.log

cd "$REPO_DIR"
source env/activate

cd "data/sim/{sim_name}"

export OMP_NUM_THREADS={sim_job_omp}

ntasks=$((16/$OMP_NUM_THREADS))
opts="-v -machinefile $PBS_NODEFILE -npernode $ntasks -x LD_LIBRARY_PATH"
run_gizmo="mpirun $opts ./GIZMO params.txt"
if [ -d output/restartfiles ]; then
    $run_gizmo 1
else
    $run_gizmo
fi
