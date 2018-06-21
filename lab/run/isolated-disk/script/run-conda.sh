#!/usr/bin/env bash

source "$PROJECT_DIR/code/config/conda/init.sh"

cd "$PROJECT_DIR/lab/run/isolated-disk"
mpirun -np 2 ./GIZMO coolsf.par
