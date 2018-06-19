#!/usr/bin/env bash
echo "Conda environment:"
echo "$CONDA_PREFIX"

HERE="$PWD"
EXTERN="../../code/extern"

echo
echo "Compiling grackle"
THERE="$EXTERN/grackle-gizmo-agora"
cp -f grackle_Make.mach.conda "$THERE/src/clib/Make.mach.conda"
cd "$THERE"
./configure
cd src/clib
make machine-conda
make show-config
make
make install
make clean
cd "$HERE"

echo
echo "Compiling GIZMO"
THERE="$EXTERN/gizmo-agora"
cp -f gizmo_Makefile.systype "$THERE/Makefile.systype"
cd "$THERE"
echo $PWD
make
mv -f GIZMO "$HERE/"
make clean
cd "$HERE"
