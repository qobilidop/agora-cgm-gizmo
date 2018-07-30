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
export OMP_NUM_THREADS={gizmo_omp}
ppn=$(($SLURM_CPUS_ON_NODE / $OMP_NUM_THREADS))
RUN="mpirun -print-rank-map -ppn $ppn GIZMO-{gizmo_config} params.txt"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
