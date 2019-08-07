#!/usr/bin/env bash

spack env activate -d "$PWD/env/spack"
conda activate "$PWD/env/conda"

JOB_INIT=$(cat <<EOF
set -e
module list
cd $PWD && source env/activate.sh && cd -
set -x
pwd
EOF
)
export JOB_INIT
