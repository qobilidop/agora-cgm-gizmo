#!/usr/bin/env bash

conda activate "$PWD/env/conda"
spack env activate -d "$PWD/env/spack"

JOB_INIT=$(cat <<EOF
set -e
module list
cd $PWD && source env/activate.sh && cd -
set -x
pwd
EOF
)
export JOB_INIT
