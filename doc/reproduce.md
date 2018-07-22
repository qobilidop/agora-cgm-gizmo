# Reproduction Notes

## Initialize environment

```bash
source env/activate
source env/{system}/activate
make init
```

`{system}` could be `conda` or `tscc`. `conda` is used on my laptop for testing. `tscc` is used on [TSCC](http://www.sdsc.edu/support/user_guides/tscc.html) for production.

## Activate environment

```bash
source env/activate
```

This step must be performed before any following steps.

## Run simulations

All simulation outputs would be saved in `data/sim`.

### Isolated IC

```bash
cd code/task/1-isolated
./all-init.sh
./all-submit-tscc.sh  # on TSCC where the simulations are run
```

### Cosmological IC
