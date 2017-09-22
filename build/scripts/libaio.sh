#!/bin/bash
set -e -u
ARCHIVE=libaio_0.3.110.orig.tar.gz
ARCHIVEDIR=libaio-0.3.110
. $KOBO_SCRIPT_DIR/build-common.sh

pushd $ARCHIVEDIR
	CC=${CC} prefix=${DEVICEROOT} $MAKE -j$MAKE_JOBS
	$MAKE prefix=${DEVICEROOT} install
popd
markbuilt
