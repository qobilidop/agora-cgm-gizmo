#!/bin/bash -l
#SBATCH -J isolated-disk
#SBATCH -q shared
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -o job.o
#SBATCH -L SCRATCH
#SBATCH --workdir=.

export I_MPI_FABRICS=ofi
export I_MPI_OFI_PROVIDER=gni
export I_MPI_OFI_LIBRARY=/usr/common/software/libfabric/1.5.0/gnu/lib/libfabric.so
export I_MPI_PMI_LIBRARY=/usr/lib64/slurmpmi/libpmi.so 

export OMP_NUM_THREADS=1
export OMP_PROC_BIND=spread
export OMP_PLACES=threads

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PWD/../local/lib"

srun -n 4 ./../GIZMO coolsf.par
