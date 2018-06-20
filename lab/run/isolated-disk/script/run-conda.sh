#!/usr/bin/env bash

conda activate "$LOCAL_PREFIX"

cd "$PROJECT_DIR/lab/run/isolated-disk"
mpirun -np 2 ./GIZMO coolsf.par
