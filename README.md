# AGORA GIZMO Runs

## Reproduction Notes

Basically, just run [tasks](code/task) in order. Isolated runs (task 1-2) are done on [TSCC](http://www.sdsc.edu/support/user_guides/tscc.html). Cosmological runs (task 3-5) are done on [Edison](http://www.nersc.gov/users/computational-systems/edison/).

Before executing tasks, a proper environment should be set up and activated.

To set up an environment (only need to do it once):
```bash
echo "{GALENV_SYS}" > .galenv  # "{GALENV_SYS}" could be "tscc" or "edison"
source env/activate
./env/init-galenv.sh
```

To activate an environment (have to do it every time before executing tasks):
```bash
source env/activate
```
