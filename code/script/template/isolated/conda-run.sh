#!/usr/bin/env bash

cd "$REPO_DIR"
source env/activate

cd "data/sim/{sim_name}"
RUN="mpirun -np 4 GIZMO-{gizmo_config} params.txt"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
