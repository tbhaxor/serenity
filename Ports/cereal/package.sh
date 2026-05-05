#!/usr/bin/env -S bash ../.port_include.sh
port='cereal'
version='1.3.2'
useconfigure='true'
files=(
    "https://github.com/USCiLab/cereal/archive/refs/tags/v${version}.tar.gz#16a7ad9b31ba5880dac55d62b5d6f243c3ebc8d46a3514149e56b5e7ea81f85f"
)
depends+=(
    boost
)
configopts=(
    "-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt"
    '-DCMAKE_BUILD_TYPE=Release'
    '-DBUILD_TESTS=OFF'
    '-DBUILD_SANDBOX=OFF'
)
DESTDIR=

configure() {
    run cmake "${configopts[@]}" -S . -B .
}
