#!/usr/bin/env bash
set -e

cd "$LOCAL_PREFIX/opt/fftw-2.1.5"
CONFIGURE="./configure --prefix=$LOCAL_PREFIX --enable-mpi --enable-shared --enable-threads --enable-type-prefix"
$CONFIGURE
make uninstall
$CONFIGURE --enable-float
make uninstall
make clean
