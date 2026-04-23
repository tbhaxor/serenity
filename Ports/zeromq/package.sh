#!/usr/bin/env -S bash ../.port_include.sh
port='libzmq'
useconfigure='true'
version='4.3.5'
workdir="zeromq-${version}"
configopts=(
    "-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt"
    "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
)
curlopts+=(hi)
files=(
    "https://github.com/zeromq/libzmq/releases/download/v${version}/zeromq-${version}.tar.gz#6653ef5910f17954861fe72332e68b03ca6e4d9c7160eb3a8de5a5a913bfab43"
)
echo "${curlopts[@]}"
exit 1
configure() {
    run cmake -Bbuild "${configopts[@]}"
}

build() {
    run cmake --build build
}

install() {
    run cmake --build build --target install
}
