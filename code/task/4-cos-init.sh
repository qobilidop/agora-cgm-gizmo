#!/usr/bin/env bash
set -e

export SIM_IC=1e12q.dat
export SIM_JOB_OMP=2
export SIM_JOB_NODES=8
export SIM_JOB_TEMPLATE="$REPO_DIR/code/script/sim-job-template/edison.sh"
for sim_config in "$REPO_DIR"/data/sim/cosmological-*.sh; do
    SIM_NAME="$(basename "$sim_config" .sh)"
    export SIM_NAME
    echo "Initializing $SIM_NAME"
    source "$sim_config"
    init-sim.sh
    # Extra preparations for cosmological runs
    cd "$REPO_DIR/data/sim/$SIM_NAME"
    cp "$REPO_DIR/data/ic/1e12q.conf" ic.conf
    cp "$REPO_DIR/data/ot/output-a.txt" output-times.txt
done
