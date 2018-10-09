#!/usr/bin/env bash
set -e

mkdir -p "$PROJECT_ROOT/data/sim/$SIM_NAME"
cd "$PROJECT_ROOT/data/sim/$SIM_NAME"

# Copy IC
cp "$PROJECT_ROOT/data/ic/$SIM_IC" ic.dat

# Copy GIZMO files
cp "$GALENV_LOCAL/bin/GIZMO-$GIZMO_CONFIG" GIZMO
cp "$GALENV_LOCAL/opt/$GALENV_GIZMO_DIR/cooling/TREECOOL" .
cp "$PROJECT_ROOT/config/gizmo/config/$GIZMO_CONFIG.sh" Config.sh
cp "$PROJECT_ROOT/config/gizmo/params/$GIZMO_PARAMS.txt" params.txt

# Copy Grackle files
for cloudy_table in CloudyData_UVB=HM2012.h5 CloudyData_UVB=HM2012_shielded.h5; do
    if grep -q "$cloudy_table" params.txt; then
        cp "$GALENV_LOCAL/opt/$GALENV_GRACKLE_DIR/input/$cloudy_table" .
    fi
done

# Prepare job script
replace=(
    -e "s/{sim_name}/$SIM_NAME/g"
    -e "s/{sim_job_omp}/$SIM_JOB_OMP/g"
    -e "s/{sim_job_nodes}/$SIM_JOB_NODES/g"
)
sed "${replace[@]}" "$SIM_JOB_TEMPLATE" > sim-job.sh
chmod +x sim-job.sh
