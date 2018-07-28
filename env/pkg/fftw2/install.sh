#!/usr/bin/env bash
set -e

mkdir -p "$LOCAL_PREFIX/opt"
cd "$LOCAL_PREFIX/opt"

# Download
remote=http://www.fftw.org/fftw-2.1.5.tar.gz
curl "$remote" | tar xz
cd fftw-2.1.5

# Compile & install
CONFIGURE="./configure --prefix=$LOCAL_PREFIX --enable-mpi --enable-shared --enable-threads --enable-type-prefix"
CONFIGURE="$CONFIGURE CC=$LOCAL_CC MPICC=$LOCAL_MPICC CFLAGS=$CFLAGS"

configs=(
    # single
    "$CONFIGURE --enable-float"
    # double
    "$CONFIGURE"
)

for config in "${configs[@]}"
do
    $config
    make -j
    make install
done
