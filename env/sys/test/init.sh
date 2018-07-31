#!/usr/bin/env bash
set -e

echo "Create conda env"
cd "$(dirname "$0")"
source enable-conda
conda env create -f environment.yml -p "$LOCAL_CONDA_PREFIX"
cd "$REPO_DIR"
source env/activate
cd code
pip install -e .
