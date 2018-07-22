#!/usr/bin/env bash
set -e
this_dir="$(cd "$(dirname "$0")" && pwd)"

# Change to the simulation directory
SIM_DIR="$PROJECT_DIR/data/sim/$SIM_NAME"
mkdir -p "$SIM_DIR"
cd "$SIM_DIR"

# Prepare data files
## GIZMO files
cp "$PROJECT_DIR/.local/opt/gizmo-agora/cooling/TREECOOL" .
cp "$PROJECT_DIR/data/ic/isolated/low.dat" ic.dat
cp "$PROJECT_DIR/data/params/$SIM_GIZMO_PARAMS" .
## Grackle files
cp "${PROJECT_DIR}/.local/opt/grackle-gizmo-agora/input/CloudyData_UVB=HM2012.h5" .

# Change to the simulation scripts directory
cd "$this_dir"
mkdir -p "sim/$SIM_NAME"
cd "sim/$SIM_NAME"

# Prepare scripts
replace=(-e "s/{sim_name}/$SIM_NAME/g"
         -e "s/{sim_gizmo_bin}/$SIM_GIZMO_BIN/g"
         -e "s/{sim_gizmo_params}/$SIM_GIZMO_PARAMS/g")
template_dir="$PROJECT_DIR/code/task/template"
sed "${replace[@]}" "$template_dir/job-tscc.sh" > job-tscc.sh
sed "${replace[@]}" "$template_dir/run-conda.sh" > run-conda.sh
chmod +x *.sh
