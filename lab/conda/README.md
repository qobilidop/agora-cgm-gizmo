# Test Run in Conda Environment

## Usage

```bash
conda env create -f environment.yml
conda activate agora-gizmo
# or `source activate agora-gizmo` for older versions of conda
./compile.sh
cd isolated-disk
make
```
