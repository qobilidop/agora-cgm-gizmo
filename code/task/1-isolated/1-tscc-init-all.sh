#!/usr/bin/env bash
set -e

cd "$REPO_DIR/data"
for sim_config in sim-config/isolated-*.sh; do
    SIM_NAME="$(basename "$sim_config" .sh)"
    echo "Initializing $SIM_NAME"
    source "$sim_config"
    (
        # Prepare data files
        mkdir -p "sim/$SIM_NAME"
        cd "sim/$SIM_NAME"
        ## IC
        cp "$REPO_DIR/data/sim-config/ic/isolated/low.dat" ic.dat
        ## GIZMO files
        cp "$REPO_DIR/.local/opt/gizmo-agora/cooling/TREECOOL" .
        cp "$REPO_DIR/data/sim-config/params/$SIM_GIZMO_PARAMS" .
        ## Grackle files
        cp "${REPO_DIR}/.local/opt/grackle-gizmo-agora/input/CloudyData_UVB=HM2012.h5" .

        # Prepare scripts
        mkdir -p script
        cd script
        replace=(-e "s/{sim_name}/$SIM_NAME/g"
                -e "s/{sim_gizmo_bin}/$SIM_GIZMO_BIN/g"
                -e "s/{sim_gizmo_params}/$SIM_GIZMO_PARAMS/g")
        template_dir="$REPO_DIR/data/sim-config/script-template"
        sed "${replace[@]}" "$template_dir/tscc-job.sh" > tscc-job.sh
        sed "${replace[@]}" "$template_dir/conda-run.sh" > conda-run.sh
        chmod +x ./*.sh
    )
done
