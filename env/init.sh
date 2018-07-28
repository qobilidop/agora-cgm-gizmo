#!/usr/bin/env bash
set -e

echo "$REPO_DIR"
cd "$REPO_DIR"
source env/activate

echo "Initialize local sys: $LOCAL_SYS"
./env/sys/"$LOCAL_SYS"/init.sh
source env/activate

echo "Install packages"
./env/pkg/install-all.sh
