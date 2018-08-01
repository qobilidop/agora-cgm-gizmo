# AGORA GIZMO Runs

## Reproduction notes

All the work are done on [TSCC](http://www.sdsc.edu/support/user_guides/tscc.html).

### Environment

Initialize environment the first time on TSCC:
```bash
source env/activate
source env/sys/tscc/activate
make init
```

For subsequent runs, remember to activate the environment before anything else:
```bash
source env/activate
```

### Tasks

#### Isolated runs

```bash
cd code/tscc/task/1-isolated
# Initialize simulations
./1-init-sim.sh
# Submit simulations
./2-submit-sim.sh
# Wait until all simulations are finished
# Make the star formation history plot
./3-plot-sfh.sh
```

#### Cosmological runs

```bash
cd code/tscc/task/2-cosmological
# Make cosmological IC
./1-make-ic.sh
# Wait until the IC is made
# Initialize simulations
./2-init-sim.sh
# Submit simulations
./3-submit-sim.sh
```
