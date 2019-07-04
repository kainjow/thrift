#!/bin/sh
set -ev

# bison is keg-only, which means it was not symlinked into /usr/local,
# so we need to add it to PATH.
export PATH="/usr/local/opt/bison/bin:$PATH"

export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH" # so pkg-config finds libffi for gobject-2.0
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"

./bootstrap.sh
./configure \
	--with-c_glib \
	--without-cpp \
	--without-boost \
	--without-libevent \
	--without-lua \
	--without-qt5 \
	--without-csharp \
	--without-java \
	--without-erlang \
	--without-nodejs \
	--without-nodets \
	--without-python \
	--without-py3 \
	--without-perl \
	--without-php \
	--without-php_extension \
	--without-dart \
	--without-ruby \
	--without-haskell \
	--without-go \
	--without-swift \
	--without-rs \
	--without-cl \
	--without-haxe \
	--without-donotcore \
	--without-d \
	--prefix=$(pwd)/output
make -j$(sysctl -n hw.ncpu) precross CPPFLAGS="-I/usr/local/opt/openssl/include"

set +e
make cross PYTHON=$(which python3)

RET=$?
if [ $RET -ne 0 ]; then
  cat test/log/unexpected_failures.log
fi

exit $RET
