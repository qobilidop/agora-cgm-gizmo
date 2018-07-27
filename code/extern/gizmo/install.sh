#!/usr/bin/env bash
set -e

mkdir -p "$LOCAL_PREFIX/opt"
cd "$LOCAL_PREFIX/opt"

# Download
remote=https://bitbucket.org/qobilidop/gizmo-agora
branch=agora
hg clone "$remote" -u "$branch"
cd gizmo-agora

# Patch
cp -f "$REPO_DIR/code/extern/gizmo/Makefile.systype" .

# Compile
for config in "$REPO_DIR"/data/sim-spec/config/*.sh; do
    label="$(basename "$config" .sh)"
    echo
    echo "Compile version: $label"
    cp "$config" Config.sh
    make clean
    make -j
    mv GIZMO "GIZMO-$label"
done
make clean

# Install
mv GIZMO-* "$LOCAL_PREFIX/bin/"

# Test
for config in "$REPO_DIR"/data/sim-spec/config/*.sh; do
    label="$(basename "$config" .sh)"
    command -v "GIZMO-$label"
done
