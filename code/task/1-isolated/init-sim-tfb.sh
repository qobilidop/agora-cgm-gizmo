#!/usr/bin/env bash

export SIM_NAME=iso-tfb
export SIM_GIZMO_BIN=GIZMO-tfb
export SIM_GIZMO_PARAMS=params.txt

cd "$(dirname "$0")"
./init-sim.sh
