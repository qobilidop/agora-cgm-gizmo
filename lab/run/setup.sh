#!/usr/bin/env bash

# Change to simulation directory
mkdir -p $SIM_NAME
cd $SIM_NAME

# Prepare necessary files

## GIZMO files
cp "$PROJECT_ROOT/code/bin/$GIZMO_CMD" GIZMO
cp "$PROJECT_ROOT/code/extern/gizmo-agora/cooling/TREECOOL" .
cp "$PROJECT_ROOT/data/ic/$GIZMO_IC" ic.dat
cp "$PROJECT_ROOT/data/$GIZMO_PARAMS" .

## Grackle files
cp "${PROJECT_ROOT}/code/extern/grackle-gizmo-agora/input/CloudyData_UVB=HM2012.h5" .

## Scripts
sed s/{sim_name}/$SIM_NAME/g ../template/job-tscc.sh > job.sh
sed s/{sim_name}/$SIM_NAME/g ../template/run-conda.sh > run.sh
chmod +x run.sh
printf "#!/usr/bin/env bash\n\n./../setup-$SIM_NAME.sh\n" > update.sh
chmod +x update.sh
