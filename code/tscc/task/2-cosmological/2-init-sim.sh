#!/usr/bin/env bash
set -e

export SIM_IC=1e12q.dat
export TSCC_NODES=8
for sim_config in "$REPO_DIR"/data/sim/cosmological-*.sh; do
    SIM_NAME="$(basename $sim_config .sh)"
    export SIM_NAME
    echo "Initializing $SIM_NAME"
    source "$sim_config"
    init-sim.sh
    cp "$REPO_DIR/data/misc/output-a.txt" "$REPO_DIR/data/sim/$SIM_NAME/output-times.txt"
done
