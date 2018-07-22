#!/usr/bin/env bash
set -e

mkdir -p "$LOCAL_PREFIX/opt"
cd "$LOCAL_PREFIX/opt"

# Download
remote=http://www.fftw.org/fftw-2.1.5.tar.gz
curl "$remote" | tar xz
cd fftw-2.1.5

# Compile & install
## Installing FFTW in both single and double precision
## See http://www.fftw.org/fftw2_doc/fftw_6.html#SEC69
CONFIGURE="./configure --prefix="$LOCAL_PREFIX" --enable-type-prefix --enable-mpi CC=$LOCAL_CC MPICC=$LOCAL_MPICC CFLAGS="$LOCAL_CFLAGS" LDFLAGS="$LOCAL_LDFLAGS""
## Single precision
$CONFIGURE
make
make install
make clean
## Double precision
$CONFIGURE --enable-float
make
make install
