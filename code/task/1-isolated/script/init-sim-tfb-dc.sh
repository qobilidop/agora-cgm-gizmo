#!/usr/bin/env bash

export SIM_NAME=iso-tfb-dc
export SIM_GIZMO_BIN=GIZMO-tfb-dc
export SIM_GIZMO_PARAMS=params.txt

cd "$(dirname "$0")"
./init-sim.sh
