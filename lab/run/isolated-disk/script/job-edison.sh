#!/bin/bash -l
#SBATCH -J isolated-disk
#SBATCH -q regular
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -o job.o
#SBATCH -L SCRATCH

export I_MPI_FABRICS=ofi
export I_MPI_OFI_PROVIDER=gni
export I_MPI_OFI_LIBRARY=/usr/common/software/libfabric/1.5.0/gnu/lib/libfabric.so
export I_MPI_PMI_LIBRARY=/usr/lib64/slurmpmi/libpmi.so 

export OMP_NUM_THREADS=1
export OMP_PROC_BIND=spread
export OMP_PLACES=threads

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LOCAL_PREFIX"

cd "$PROJECT_DIR/lab/run/isolated-disk"
srun -c 1 ./GIZMO coolsf.par
