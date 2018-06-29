# AGORA GIZMO Runs

Make sure to `source .envrc` before doing anything else. This exports necessary environment variables used elsewhere.

## Installation

Make sure [Mercurial](https://www.mercurial-scm.org/) (hg) is available. Then proceed with:
```bash
cd code
source config/{env}/init.sh  # {env} could be conda or tscc
make
```

## Run a Single Simulation

```bash
cd lab/run
./setup-{sim_name}.sh
cd {sim_name}
./run.sh  # run in a conda environment
qsub job.sh  # submit a job on TSCC
```

## Batch Process

```bash
cd lab/run
./all-setup.sh
./all-submit.sh  # on TSCC
```
