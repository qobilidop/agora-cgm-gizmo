export PROJECT_ENV=conda

# Enable conda
. "$("$CONDA_EXE" info --root)"/etc/profile.d/conda.sh

# Create conda env
cd "$(dirname "$0")"
if [[ ! -d $PROJECT_PREFIX/conda-meta ]]; then
    conda env create -f environment.yml -p "$PROJECT_PREFIX"
fi
cd -

# Activate conda env
conda activate "$PROJECT_PREFIX"
