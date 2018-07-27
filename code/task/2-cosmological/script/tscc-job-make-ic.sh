#!/usr/bin/env bash
#PBS -N make-ic
#PBS -q condo
#PBS -l nodes=1:ppn=16
#PBS -l walltime=1:00:00
#PBS -V
set -e

cd "$REPO_DIR"
source env/activate

cd "data/sim-spec/ic/cosmological"
if [ ! -f 1e12q.dat ]; then
    # Run MUSIC in a temperary directory
    mkdir -p 1e12q
    cd 1e12q
    MUSIC ../1e12q.conf
    # Save IC data & remove all the rest
    mv 1e12q.dat ../
    cd -
    rm -rf 1e12q
fi
