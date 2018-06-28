#!/usr/bin/env bash

for run in */ ; do
    cd $run
    rm -rf *.[oe]* output
    cd -
done
