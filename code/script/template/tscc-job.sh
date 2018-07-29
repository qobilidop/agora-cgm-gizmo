#!/usr/bin/env bash
#PBS -N {sim_name}
#PBS -q condo
#PBS -l nodes={tscc_nodes}:ppn=16
#PBS -l walltime=8:00:00
#PBS -V
#PBS -j oe
#PBS -o tscc-job.log

cd "$REPO_DIR"
source env/activate

cd "data/sim/{sim_name}"
export OMP_NUM_THREADS={gizmo_omp}
RUN="mpirun -v -machinefile $PBS_NODEFILE --map-by ppr:$((16/{gizmo_omp})):node"
RUN="$RUN -x PATH -x LD_LIBRARY_PATH -x OMP_NUM_THREADS"
RUN="$RUN GIZMO-{gizmo_config} params.txt"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
