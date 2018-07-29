#!/usr/bin/env bash
set -e

echo "Link data dir"
cd "$REPO_DIR"
data_dir="$HOME/data/$REPO_NAME"
mkdir -p "$data_dir"
rm -r data
ln -s "$data_dir" data

cd "$(dirname "$0")"
echo "Install local Python packages"
source enable-conda
conda env create -f environment.yml -p "$LOCAL_CONDA_PREFIX"
