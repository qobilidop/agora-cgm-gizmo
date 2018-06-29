#!/usr/bin/env bash

for sim in Sim-*/ ; do
    cd $sim
    qsub job.sh
    cd -
done
