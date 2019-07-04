#!/bin/sh
set -ev

CONFIG=Release

# bison from homebrew
export PATH="/usr/local/opt/bison/bin:${PATH}"

# openssl from homebrew
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

mkdir -p cmake_build && cd cmake_build
cmake -GXcode .. \
	-DWITH_CPP=OFF \
	-DWITH_C_GLIB=ON \
	-DWITH_JAVA=OFF \
	-DWITH_PYTHON=OFF
cmake --build . --config ${CONFIG}
ctest -VV -C ${CONFIG}
