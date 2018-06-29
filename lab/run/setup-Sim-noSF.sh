#!/usr/bin/env bash

export SIM_NAME=Sim-noSF
export GIZMO_CMD=GIZMO-noSF
export GIZMO_IC=isolated/low.dat
export GIZMO_PARAMS=params.txt

cd "$(dirname "$0")"
./setup.sh
