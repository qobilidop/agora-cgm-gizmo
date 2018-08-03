#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

export SIM_IC=disk-low.dat
export SIM_JOB_OMP=1
export SIM_JOB_NODES=1
export SIM_JOB_TEMPLATE="$REPO_DIR/code/script/sim-job-template/tscc.sh"
for sim_config in "$REPO_DIR"/data/sim/isolated-*.sh; do
    SIM_NAME="$(basename "$sim_config" .sh)"
    export SIM_NAME
    echo "Initializing $SIM_NAME"
    source "$sim_config"
    init-sim.sh
done
