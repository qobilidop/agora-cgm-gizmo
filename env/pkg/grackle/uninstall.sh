#!/usr/bin/env bash

cd "$LOCAL_PREFIX"
rm -rf include/{chemistry_data.h,code_units.h,grackle*} \
       lib/libgrackle* \
       opt/grackle-gizmo-agora
