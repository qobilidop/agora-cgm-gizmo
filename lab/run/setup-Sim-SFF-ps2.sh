#!/usr/bin/env bash

export SIM_NAME=Sim-SFF-ps2
export GIZMO_CMD=GIZMO-SFF
export GIZMO_IC=isolated/low.dat
export GIZMO_PARAMS=params-ps2.txt

cd "$(dirname "$0")"
./setup.sh
