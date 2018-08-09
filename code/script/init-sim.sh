#!/usr/bin/env bash
set -e

mkdir -p "$PROJECT_ROOT/data/sim/$SIM_NAME"
cd "$PROJECT_ROOT/data/sim/$SIM_NAME"

# Copy IC
cp "$PROJECT_ROOT/data/ic/$SIM_IC" ic.dat

# Copy GIZMO files
cp "$GALENV_LOCAL/bin/GIZMO-$GIZMO_CONFIG" GIZMO
cp "$GALENV_LOCAL/opt/$GALENV_GIZMO_DIR/cooling/TREECOOL" .
cp "$PROJECT_ROOT/data/gizmo/config/$GIZMO_CONFIG.sh" Config.sh
cp "$PROJECT_ROOT/data/gizmo/params/$GIZMO_PARAMS.txt" params.txt

# Copy Grackle files
cp "$GALENV_LOCAL/opt/$GALENV_GRACKLE_DIR/input/CloudyData_UVB=HM2012.h5" .

# Prepare job script
replace=(
    -e "s/{sim_name}/$SIM_NAME/g"
    -e "s/{sim_job_omp}/$SIM_JOB_OMP/g"
    -e "s/{sim_job_nodes}/$SIM_JOB_NODES/g"
)
sed "${replace[@]}" "$SIM_JOB_TEMPLATE" > sim-job.sh
chmod +x sim-job.sh
