#!/bin/sh
set -ev

CONFIG=Release

# bison is keg-only from Homebrew, which means it was not symlinked into /usr/local,
# so we need to add it to PATH.
export PATH="/usr/local/opt/bison/bin:${PATH}"

mkdir -p cmake_build && cd cmake_build
cmake -GXcode .. \
	-DWITH_C_GLIB=ON \
	-DWITH_OPENSSL=ON \
	-DOPENSSL_ROOT_DIR=/usr/local/opt/openssl \
	-DWITH_CPP=OFF \
	-DWITH_JAVA=OFF \
	-DWITH_PYTHON=OFF
cmake --build . --config ${CONFIG}
ctest -VV -C ${CONFIG}
