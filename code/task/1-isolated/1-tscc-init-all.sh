#!/usr/bin/env bash
set -e

cd "$REPO_DIR/data"
export SIM_IC="isolated/low.dat"
export TEMPLATE_DIR="$REPO_DIR/data/sim-spec/script-template/isolated"
for sim_spec in sim-spec/isolated-*.sh; do
    SIM_NAME="$(basename "$sim_spec" .sh)"
    export SIM_NAME
    echo "Initializing $SIM_NAME"
    source "$sim_spec"
    init-sim.sh
done
