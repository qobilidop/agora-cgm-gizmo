#!/usr/bin/env bash
set -e

PKG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
mkdir -p "$LOCAL_PREFIX/opt"
cd "$LOCAL_PREFIX/opt"

# Download
remote=https://bitbucket.org/qobilidop/grackle-gizmo-agora
branch=gizmo-agora
hg clone "$remote" -u "$branch"
cd grackle-gizmo-agora

# Patch
cp -f "$PKG_DIR/Make.mach.local" src/clib/Make.mach.local

# Compile & Install
./configure
cd src/clib
make machine-local 
make
make install
cd -

# Test
cd src/example
make clean
make LDFLAGS="-Wl,-rpath -Wl,$LOCAL_PREFIX/lib"
set +e
./cxx_example 2>&1
set -e