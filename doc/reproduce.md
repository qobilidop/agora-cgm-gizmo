# Reproduction Notes

## Initialize environment

```bash
# Init env on my laptop
source env/activate
source env/conda/activate
make init
source env/activate

# Init env on TSCC
make deploy
ssh tscc
cd project/agora-gizmo
source env/activate
source env/tscc/activate
make init
exit
## Deploy again to fill the data dir
make deploy
```

## Activate environment

Environment must be activated before doing anything else.

```bash
source env/activate
```

## Run simulations

All simulation outputs are saved in `data/sim`.

### Isolated IC

```bash
# Run simulations on TSCC
make deploy
ssh tscc
cd project/agora-gizmo
source env/activate
cd code/task/1-isolated
./1-tscc-init-all.sh
./2-tscc-submit-all.sh
exit

# Make plots on laptop
make capture
cd code/task/1-isolated
./3-conda-plot.py
```

### Cosmological IC

```bash
make deploy
ssh tscc
cd project/agora-gizmo
cd code/task/2-cosmological
./1-tscc-make-ic.sh
```
