#!/usr/bin/env -S bash ../.port_include.sh
port='armadillo'
useconfigure='true'
version='15.2.6'
files=(
    "https://sourceforge.net/projects/arma/files/armadillo-${version}.tar.xz#97cb8ef708541f632e861d005a462dd0367240f81ff96f8e63ebbdd75c8ce55f"
)
configopts=(
    "-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt"
    '-DBUILD_SMOKE_TEST=OFF'
)
DESTDIR=

configure() {
    run cmake -S . -B . "${configopts[@]}"
}
