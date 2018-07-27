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
make clean
## No star formation
cp "$REPO_DIR/code/extern/gizmo/Config-nosf.sh" Config.sh
make -j
mv GIZMO GIZMO-nosf
make clean
## Thermal feedback
cp "$REPO_DIR/code/extern/gizmo/Config-tfb.sh" Config.sh
make -j
mv GIZMO GIZMO-tfb
make clean
## Thermal feedback with delayed coooling
cp "$REPO_DIR/code/extern/gizmo/Config-tfb-dc.sh" Config.sh
make -j
mv GIZMO GIZMO-tfb-dc
make clean
## Mechanical feedback
cp "$REPO_DIR/code/extern/gizmo/Config-mfb.sh" Config.sh
make -j
mv GIZMO GIZMO-mfb
make clean

# Install
mv GIZMO* "$LOCAL_PREFIX/bin/"

# Test
which GIZMO-nosf
which GIZMO-tfb
which GIZMO-tfb-dc
which GIZMO-mfb
