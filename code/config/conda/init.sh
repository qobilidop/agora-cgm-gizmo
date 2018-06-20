export SYSTEM=conda

conda env create -f "$PROJECT_DIR/code/config/$SYSTEM/environment.yml" -p "$LOCAL_PREFIX"
conda activate "$LOCAL_PREFIX"
