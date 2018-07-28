#!/usr/bin/env bash
set -e

echo "Link data dir"
cd "$REPO_DIR"
data_dir="$HOME/data/$REPO_NAME"
mkdir -p "$data_dir"
rm -r data
ln -s "$data_dir" data
