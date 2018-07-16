#!/usr/bin/env bash
set -e

cd "$LOCAL_PREFIX/opt/fftw-2.1.5"
CONFIGURE="./configure --prefix="$LOCAL_PREFIX" --enable-type-prefix --enable-mpi"
$CONFIGURE
make uninstall
$CONFIGURE --enable-float
make uninstall
make clean
