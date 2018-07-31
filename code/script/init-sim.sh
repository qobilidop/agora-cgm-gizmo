#!/usr/bin/env bash
set -e

mkdir -p "$REPO_DIR/data/sim/$SIM_NAME"
cd "$REPO_DIR/data/sim/$SIM_NAME"

# Copy IC
cp "$REPO_DIR/data/ic/$SIM_IC" ic.dat

# Copy GIZMO files
cp "$REPO_DIR/.local/bin/GIZMO-$GIZMO_CONFIG" GIZMO
cp "$REPO_DIR/.local/opt/gizmo-agora/cooling/TREECOOL" .
cp "$REPO_DIR/data/gizmo/params/$GIZMO_PARAMS.txt" params.txt

# Copy Grackle files
cp "$REPO_DIR/.local/opt/grackle-gizmo-agora/input/CloudyData_UVB=HM2012.h5" .

# Prepare job script
replace=(
    -e "s/{sim_name}/$SIM_NAME/g"
    -e "s/{tscc_nodes}/$TSCC_NODES/g"
)
tscc_job_tmpl="$REPO_DIR/code/tscc/job/run-sim.sh.tmpl"
sed "${replace[@]}" "$tscc_job_tmpl" > tscc-job.sh
chmod +x tscc-job.sh
