#!/usr/bin/env bash

source "$PROJECT_DIR/code/config/conda/init.sh"

cd "$PROJECT_DIR/lab/run/isolated-disk"
RUN="mpirun -np 2 ./GIZMO coolsf.par"
if [ -d output/restartfiles ]; then
    $RUN 1
else
    $RUN
fi
