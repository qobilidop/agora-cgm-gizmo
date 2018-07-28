#!/usr/bin/env bash
set -e

export SIM_IC=1e12q.dat
export TSCC_NODES=4
export GIZMO_OMP=2
for sim_config in "$REPO_DIR"/code/config/cosmological-*.sh; do
    SIM_NAME="$(basename "$sim_config" .sh)"
    export SIM_NAME
    echo "Initializing $SIM_NAME"
    source "$sim_config"
    init-sim.sh
done
