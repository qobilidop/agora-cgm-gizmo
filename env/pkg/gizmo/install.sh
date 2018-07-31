#!/usr/bin/env bash
set -e

PKG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
mkdir -p "$LOCAL_PREFIX/opt"
cd "$LOCAL_PREFIX/opt"

# Download
remote=https://bitbucket.org/qobilidop/gizmo-agora
branch=agora
hg clone "$remote" -u "$branch"
cd gizmo-agora

# Patch
cp -f "$PKG_DIR/Makefile.systype" .

# Compile
gizmo_config_dir="$REPO_DIR/data/gizmo/config"
for config in "$gizmo_config_dir"/*.sh; do
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
for config in "$gizmo_config_dir"/*.sh; do
    label="$(basename "$config" .sh)"
    command -v "GIZMO-$label"
done
