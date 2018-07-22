#!/usr/bin/env bash
set -e

echo "Install local Python packages"
source enable-conda
conda env create -f "$PROJECT_DIR/env/conda/environment.yml" -p "$LOCAL_CONDA_PREFIX"