#!/usr/bin/env bash
set -e

conda env update -p env/conda -f env/conda.yaml
spack env create -d env/spack env/spack.yaml
