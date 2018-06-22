# AGORA GIZMO Runs

## Installation

Make sure [Mercurial](https://www.mercurial-scm.org/) (hg) is available. Then proceed with:
```bash
source init.sh

cd code
source config/{system}/init.sh
# {system} could be conda, edison, or tscc
make
```

## Simulation runs

Initialize:
```
source init.sh

cd lab/run/Sim-SSF
make init
```

Run in a conda environment:
```bash
./script/run-conda.sh
```

Submit a job on Edison:
```bash
sbatch script/job-edison.sh
```

Submit a job on TSCC:
```bash
qsub script/job-tscc.sh
```
