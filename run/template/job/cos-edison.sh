#!/usr/bin/env bash
#SBATCH -q regular
#SBATCH -N 8
#SBATCH -t 48:00:00
#SBATCH -o run.log
#SBATCH -L SCRATCH
#SBATCH --export=ALL
#SBATCH -D .
set -e
cd ..
echo "$PWD"
source gizenv-activate.sh

# See https://docs.nersc.gov/jobs/examples/#hybrid-mpiopenmp-jobs
export OMP_PROC_BIND=true
export OMP_PLACES=threads
export OMP_NUM_THREADS=2

date
ncpus=$(($OMP_NUM_THREADS*2))
ntasks=$(($SLURM_CPUS_ON_NODE/$ncpus))
opts="--ntasks-per-node $ntasks --cpus-per-task $ncpus"
run_gizmo="srun $opts ./GIZMO gizmo-params.txt"
if [ -d output/restartfiles ]; then
    $run_gizmo 1
else
    $run_gizmo
fi
date
