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

echo "Link data dir"
cd "$REPO_DIR"
data_dir="$HOME/data/$REPO_NAME"
mkdir -p "$data_dir"
rm -r data
ln -s "$data_dir" data
