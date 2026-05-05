#!/usr/bin/env -S bash ../.port_include.sh
port='ensmallen'
useconfigure='true'
version='3.11.0'
configopts=(
    "-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt"
)
depends+=(
    armadillo
)
files=(
    "https://ensmallen.org/files/ensmallen-${version}.tar.gz#8839a6f50aada2a930e7d79e2834a64ea8e782687d1709b7a554ceb4014be533"
)

configure() {
    run cmake -S . -B . "${configopts[@]}"
}
