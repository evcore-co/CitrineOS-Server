#!/usr/bin/env bash

ROOT=$(pwd)

cd $ROOT/citrineos-core/ ||  exit 0

if [ ! -d $ROOT/citrineos-core/node_modules ]; then
  npm run install-all
fi
