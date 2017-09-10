#!/bin/bash
set -e -u
ARCHIVE=tslib-1.12.tar.gz
ARCHIVEDIR=tslib-1.12
. $KOBO_SCRIPT_DIR/build-common.sh

pushd $ARCHIVEDIR
	echo "CPPFLAGS=\"${CPPFLAGS}\" LDFLAGS=\"${LDFLAGS}\" ./configure --prefix=/ --host=${CROSSTARGET}"
	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}" ac_cv_func_malloc_0_nonnull=yes ./configure --prefix=/ --host=${CROSSTARGET}
	$MAKE -j$MAKE_JOBS
	$MAKE DESTDIR=/${DEVICEROOT} install
popd
markbuilt
