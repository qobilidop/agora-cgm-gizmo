#!/usr/bin/env bash
set -e

mkdir -p "$REPO_DIR/data/sim/$SIM_NAME"
cd "$REPO_DIR/data/sim/$SIM_NAME"

# Copy IC
cp "$REPO_DIR/data/ic/$SIM_IC" ic.dat

# Copy GIZMO files
cp "$REPO_DIR/.local/bin/GIZMO-$GIZMO_CONFIG" GIZMO
cp "$REPO_DIR/.local/opt/gizmo-agora/cooling/TREECOOL" .
cp "$REPO_DIR/data/gizmo/config/$GIZMO_CONFIG.sh" Config.sh
cp "$REPO_DIR/data/gizmo/params/$GIZMO_PARAMS.txt" params.txt

# Copy Grackle files
cp "$REPO_DIR/.local/opt/grackle-gizmo-agora/input/CloudyData_UVB=HM2012.h5" .

# Prepare job script
replace=(
    -e "s/{sim_name}/$SIM_NAME/g"
    -e "s/{sim_job_omp}/$SIM_JOB_OMP/g"
    -e "s/{sim_job_nodes}/$SIM_JOB_NODES/g"
)
sed "${replace[@]}" "$SIM_JOB_TEMPLATE" > sim-job.sh
chmod +x sim-job.sh
