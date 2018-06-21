#!/bin/bash -l
#SBATCH -J agora-disk
#SBATCH -q shared
#SBATCH -n 2
#SBATCH -t 24:00:00
#SBATCH -L SCRATCH
#SBATCH --export=ALL

source "$PROJECT_DIR/code/config/edison/init.sh"

export I_MPI_FABRICS=ofi
export I_MPI_OFI_PROVIDER=gni
export I_MPI_OFI_LIBRARY=/usr/common/software/libfabric/1.5.0/gnu/lib/libfabric.so
export I_MPI_PMI_LIBRARY=/usr/lib64/slurmpmi/libpmi.so 

export OMP_NUM_THREADS=1
export OMP_PROC_BIND=spread
export OMP_PLACES=threads

cd "$PROJECT_DIR/lab/run/isolated-disk"
srun -c 1 ./GIZMO coolsf.par
