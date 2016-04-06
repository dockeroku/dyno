#!/bin/bash

[ -f $DYNO_DIR/export ] && source $DYNO_DIR/export

cd $BUILD_DIR && foreman start
