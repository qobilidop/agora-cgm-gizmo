#!/usr/bin/env bash
set -e

echo "Create conda env"
cd "$(dirname "$0")"
source enable-conda
conda env create -f environment.yml -p "$LOCAL_CONDA_PREFIX"

echo "Set up data dir"
cd "$REPO_DIR"
data_dir="$HOME/data/$REPO_NAME"
rm -rf "$data_dir"
mkdir -p "$(dirname "$data_dir")"
mv data "$data_dir"
ln -s "$data_dir" data
