#!/usr/bin/env -S bash ../.port_include.sh
port='openblas'
version='0.3.33'
workdir="OpenBLAS-${version}"
# useconfigure=true
files=(
    "https://github.com/OpenMathLib/OpenBLAS/releases/download/v${version}/OpenBLAS-${version}.tar.gz#6761af1d9f5d353ab4f0b7497be2643313b36c8f31caec0144bfef198e71e6ab"
)
DESTDIR=
makeopts+=(
    'BINARY=64'
    "CC=$CC" 
    "HOSTCC=$HOST_CC" 
    'TARGET=GENERIC'
)
installopts+=(
    "PREFIX=${SERENITY_INSTALL_ROOT}/usr/local"
)
