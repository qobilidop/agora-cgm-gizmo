#!/usr/bin/env bash

cd "$REPO_DIR"
source env/activate

cd "data/sim/{sim_name}"
export OMP_NUM_THREADS={gizmo_omp}
RUN="mpirun -v -np 4 GIZMO-{gizmo_config} params.txt"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
