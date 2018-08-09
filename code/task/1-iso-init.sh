#!/usr/bin/env bash
set -e

export SIM_IC=disk-low.dat
export SIM_JOB_OMP=1
export SIM_JOB_NODES=1
export SIM_JOB_TEMPLATE="$PROJECT_ROOT/code/script/sim-job-template/tscc.sh"
for sim_config in "$PROJECT_ROOT"/data/sim/isolated-*.sh; do
    SIM_NAME="$(basename "$sim_config" .sh)"
    export SIM_NAME
    echo "Initializing $SIM_NAME"
    source "$sim_config"
    init-sim.sh
done
