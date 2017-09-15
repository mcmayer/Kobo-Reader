#!/bin/bash
set -e -u
ARCHIVE=libev-4.24.tar.gz
ARCHIVEDIR=libev-4.24
. $KOBO_SCRIPT_DIR/build-common.sh

pushd $ARCHIVEDIR
	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}" ./configure --prefix=/ --host=${CROSSTARGET}
	$MAKE -j$MAKE_JOBS
	$MAKE DESTDIR=/${DEVICEROOT} install
popd
markbuilt
