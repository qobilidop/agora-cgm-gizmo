#!/usr/bin/env bash
set -e

mkdir -p "$LOCAL_PREFIX/opt"
cd "$LOCAL_PREFIX/opt"

# Download
remote=https://bitbucket.org/ohahn/music
branch=default
hg clone "$remote" -u "$branch"
cd music

# Patch
patch < "$REPO_DIR/code/extern/music/Makefile.diff"

# Compile
export CC="$LOCAL_CXX"
export OPT="-Wno-unknown-pragmas"
export CFLAGS="$LOCAL_CFLAGS"
export LFLAGS="$LOCAL_LDFLAGS"
export CPATHS="-I. "$LOCAL_FFTW3_INC" "$LOCAL_GSL_INC" "$LOCAL_HDF5_INC""
export LPATHS=""$LOCAL_FFTW3_LIB" "$LOCAL_GSL_LIB" "$LOCAL_HDF5_LIB""
make -j

# Install
mv MUSIC "$LOCAL_PREFIX/bin/"

# Test
which MUSIC
