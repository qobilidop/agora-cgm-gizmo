#!/usr/bin/env bash
set -e

PKG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
mkdir -p "$LOCAL_PREFIX/opt"
cd "$LOCAL_PREFIX/opt"

# Download
remote=https://bitbucket.org/ohahn/music
branch=default
hg clone "$remote" -u "$branch"
cd music

# Patch
patch < "$PKG_DIR/Makefile.diff"

# Compile
export CC="$LOCAL_CXX"
export OPT="-Wno-unknown-pragmas"
export CFLAGS="$LOCAL_CFLAGS $LOCAL_OMPFLAGS"
export LFLAGS="$LOCAL_LDFLAGS $LOCAL_OMPFLAGS -lgsl -lgslcblas "
export CPATHS="-I. $LOCAL_FFTW3_INC $LOCAL_GSL_INC $LOCAL_HDF5_INC"
export LPATHS="$LOCAL_FFTW3_LIB $LOCAL_GSL_LIB $LOCAL_HDF5_LIB"
make -j

# Install
mv MUSIC "$LOCAL_PREFIX/bin/"

# Test
command -v MUSIC
