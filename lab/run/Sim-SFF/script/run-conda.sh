#!/usr/bin/env bash

source "$PROJECT_DIR/code/config/conda/init.sh"

cd "$PROJECT_DIR/lab/run/Sim-SFF"
RUN="mpirun -np 2 ./GIZMO params.txt"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
