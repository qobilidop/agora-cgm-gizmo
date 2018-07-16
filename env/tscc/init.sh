#!/usr/bin/env bash
set -e

echo "Link data dir"
cd "$PROJECT_DIR"
data_dir="$HOME/data/$PROJECT_NAME"
mkdir -p "$data_dir"
rm -r data
ln -s "$data_dir" data
