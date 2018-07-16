#!/usr/bin/env bash
set -e

echo "$PROJECT_DIR"
cd "$PROJECT_DIR"
source env/activate

echo "Initialize local env: $LOCAL_ENV"
./env/"$LOCAL_ENV"/init.sh
source env/activate

echo "Install external code"
./code/extern/install-all.sh
