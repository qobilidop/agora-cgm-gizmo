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
cp -f "$PROJECT_DIR/code/extern/gizmo/Makefile.systype" .

# Compile
## noSF
cp -f "$PROJECT_DIR/code/extern/gizmo/Config-noSF.sh" Config.sh
make -j
mv GIZMO GIZMO-noSF
make clean
## SFF
cp -f "$PROJECT_DIR/code/extern/gizmo/Config-SFF.sh" Config.sh
make -j
mv GIZMO GIZMO-SFF
make clean

# Install
mv GIZMO* "$LOCAL_PREFIX/bin/"

# Test
which GIZMO-noSF
which GIZMO-SFF
