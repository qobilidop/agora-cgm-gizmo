#!/usr/bin/env bash

for run in */ ; do
    cd $run
    make
    qsub script/job-tscc.sh
    cd -
done
