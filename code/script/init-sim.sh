#!/usr/bin/env bash
set -e

# Prepare data files
mkdir -p "$REPO_DIR/data/sim/$SIM_NAME"
cd "$REPO_DIR/data/sim/$SIM_NAME"
## IC
cp "$REPO_DIR/data/ic/$SIM_IC" ic.dat
## GIZMO files
cp "$REPO_DIR/.local/opt/gizmo-agora/cooling/TREECOOL" .
cp "$REPO_DIR/code/config/gizmo/params/$GIZMO_PARAMS.txt" params.txt
## Grackle files
cp "$REPO_DIR/.local/opt/grackle-gizmo-agora/input/CloudyData_UVB=HM2012.h5" .

# Prepare scripts
mkdir -p script
cd script
replace=(-e "s/{sim_name}/$SIM_NAME/g"
         -e "s/{gizmo_config}/$GIZMO_CONFIG/g")
sed "${replace[@]}" "$TEMPLATE_DIR/tscc-job.sh" > tscc-job.sh
sed "${replace[@]}" "$TEMPLATE_DIR/conda-run.sh" > conda-run.sh
chmod +x ./*.sh
