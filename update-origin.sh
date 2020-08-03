#!/bin/bash -eux

echo "Checking aio changes in origin..."

aioHash="842b6a1247"

git -C origin fetch --all
git -C origin reset ${aioHash} --hard

git submodule sync
git submodule update --init

node scripts/sync-origin.js

echo "Finished!"
