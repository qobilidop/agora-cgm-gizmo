#!/usr/bin/env bash
#SBATCH -q regular
#SBATCH -N 8
#SBATCH -t 48:00:00
#SBATCH -o edison.log
#SBATCH -L SCRATCH
#SBATCH --export=ALL
#SBATCH -D .
set -e
cd ..
echo "$PWD"

date
export OMP_PROC_BIND=true
export OMP_PLACES=threads
export OMP_NUM_THREADS=2
ncpus=$(($OMP_NUM_THREADS*2))
ntasks=$(($SLURM_CPUS_ON_NODE/$ncpus))
opts="--ntasks-per-node $ntasks --cpus-per-task $ncpus"
run_gizmo="srun $opts ./GIZMO params.txt"
if [ -d output/restartfiles ]; then
    $run_gizmo 1
else
    $run_gizmo
fi
date
