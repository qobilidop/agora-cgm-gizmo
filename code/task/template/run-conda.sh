#!/usr/bin/env bash

cd "$PROJECT_DIR"
source env/activate

cd "data/sim/{sim_name}"
RUN="mpirun -np 4 {sim_gizmo_bin} {sim_gizmo_params}"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
