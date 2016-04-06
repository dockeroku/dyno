#!/bin/bash

mkdir -p $BUILDPACK_DIR

for buildpack in $BUILDPACKS
do
  git clone https://github.com/heroku/heroku-buildpack-$buildpack.git $BUILDPACK_DIR/$buildpack
done
