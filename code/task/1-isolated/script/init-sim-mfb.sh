#!/usr/bin/env bash

export SIM_NAME=iso-mfb
export SIM_GIZMO_BIN=GIZMO-mfb
export SIM_GIZMO_PARAMS=params.txt

cd "$(dirname "$0")"
./init-sim.sh
