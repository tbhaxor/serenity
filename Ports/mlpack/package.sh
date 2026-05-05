#!/usr/bin/env -S bash ../.port_include.sh
port='mlpack'
useconfigure='true'
version='4.7.0'
files=(
    "https://github.com/mlpack/mlpack/archive/refs/tags/4.7.0.tar.gz#a3f0fb530e51d51f8d7eceb7998b4699906d628000b158ada80541465595324e"
)
configopts=(
    "-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt"
    '-DMANUAL_ARCH=TRUE'
    "-DTOOLCHAIN_PREFIX=${SERENITY_TOOLCHAIN_BINDIR}"
)
DESTDIR=

configure() {
    run cmake -S . -B . "${configopts[@]}"
}
