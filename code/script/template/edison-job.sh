#!/usr/bin/env bash
#SBATCH -J {sim_name}
#SBATCH -q regular
#SBATCH -N {edison_nodes}
#SBATCH -t 48:00:00
#SBATCH -L SCRATCH
#SBATCH --export=ALL
#SBATCH -o edison-job.log

cd "$REPO_DIR"
source env/activate

cd "data/sim/{sim_name}"

export OMP_PROC_BIND=true
export OMP_PLACES=threads
export OMP_NUM_THREADS={gizmo_omp}

ncpus=$(($OMP_NUM_THREADS*2))
ntasks=$(($SLURM_CPUS_ON_NODE/$ncpus))
RUN="srun --ntasks-per-node $ntasks --cpus-per-task $ncpus GIZMO-{gizmo_config} params.txt"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
