#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
for init_script in script/init-sim-*.sh; do
    ./"$init_script"
done
