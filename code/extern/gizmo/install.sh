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
make clean
## No star formation
cp "$PROJECT_DIR/code/extern/gizmo/Config-nsf.sh" Config.sh
make -j
mv GIZMO GIZMO-nsf
make clean
## Thermal feedback
cp "$PROJECT_DIR/code/extern/gizmo/Config-tfb.sh" Config.sh
make -j
mv GIZMO GIZMO-tfb
make clean
## Mechanical feedback
cp "$PROJECT_DIR/code/extern/gizmo/Config-mfb.sh" Config.sh
make -j
mv GIZMO GIZMO-mfb
make clean

# Install
mv GIZMO* "$LOCAL_PREFIX/bin/"

# Test
which GIZMO-nsf
which GIZMO-tfb
which GIZMO-mfb
