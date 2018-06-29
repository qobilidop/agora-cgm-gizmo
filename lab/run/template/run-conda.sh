#!/usr/bin/env bash

source "$PROJECT_ROOT/code/config/conda/activate.sh"

cd "$PROJECT_ROOT/lab/run/{sim_name}"
RUN="mpirun -np 2 ./GIZMO params.txt"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
