#!/bin/bash

mkdir -p $CACHE_DIR
mkdir -p $ENV_DIR

for BUILDPACK in $BUILDPACKS
do

  DETECTION=$($BUILDPACK_DIR/$BUILDPACK/bin/detect $BUILD_DIR 2>/dev/null)

  if [ "$DETECTION" != "" ] && [ "$DETECTION" != "no" ]
  then

    echo "Detected $DETECTION"

    $BUILDPACK_DIR/$BUILDPACK/bin/compile $BUILD_DIR $CACHE_DIR $ENV_DIR

    [ -f $BUILDPACK_DIR/$BUILDPACK/export ] && cat $BUILDPACK_DIR/$BUILDPACK/export > $DYNO_DIR/export

    $BUILDPACK_DIR/$BUILDPACK/bin/release $BUILD_DIR | $PROCFILE

  fi

done
