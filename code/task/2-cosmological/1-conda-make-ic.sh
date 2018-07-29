#!/usr/bin/env bash
set -e

cd "$REPO_DIR"
source env/activate

cd data/ic
if [ ! -f 1e12q.dat ]; then
    # Run MUSIC in a temperary directory
    mkdir -p temp
    cd temp
    MUSIC "$REPO_DIR/code/config/ic/1e12q.conf"
    cd -
    # Save IC data & remove all the rest
    mv temp/1e12q.dat .
    rm -rf temp
fi
