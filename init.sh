export PROJECT_DIR="$PWD"
export LOCAL_PREFIX="$PROJECT_DIR/code/local"

if [ -d "$LOCAL_PREFIX/conda-meta" ]; then
    conda activate $LOCAL_PREFIX
fi
