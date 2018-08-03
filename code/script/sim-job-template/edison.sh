#!/usr/bin/env bash
#SBATCH -J {sim_name}
#SBATCH -q regular
#SBATCH -N {sim_job_nodes}
#SBATCH -t 48:00:00
#SBATCH -L SCRATCH
#SBATCH --export=ALL
#SBATCH -o sim-job.log

cd "$REPO_DIR"
source env/activate

cd "data/sim/{sim_name}"

export OMP_PROC_BIND=true
export OMP_PLACES=threads
export OMP_NUM_THREADS={sim_job_omp}

ncpus=$(($OMP_NUM_THREADS*2))
ntasks=$(($SLURM_CPUS_ON_NODE/$ncpus))
opts="--ntasks-per-node $ntasks --cpus-per-task $ncpus"
run_gizmo="srun $opts ./GIZMO params.txt"
if [ -d output/restartfiles ]; then
    $run_gizmo 1
else
    $run_gizmo
fi
