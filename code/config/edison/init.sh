export SYSTEM=edison

module purge
module load PrgEnv-intel/6.0.4 impi/2018.up1
module load intel-mkl/2017.2.174 gsl/2.3 fftw/2.1.5.9 cray-hdf5/1.10.1.1

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LOCAL_PREFIX/lib"
