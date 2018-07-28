#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
echo "Install local Python packages"
source enable-conda
conda env create -f environment.yml -p "$LOCAL_CONDA_PREFIX"

cd "$REPO_DIR"
source env/activate
cd code
pip install -e .
