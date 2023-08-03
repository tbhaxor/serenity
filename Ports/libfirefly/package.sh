#!/usr/bin/env -S bash ../.port_include.sh
project_name=firefly
# shellcheck disable=SC2034
useconfigure=true
port="lib${project_name}"
version=${LIBFIREFLY_VERSION:-2.0.0}
files=(
    "https://github.com/tbhaxor/${project_name}/archive/refs/tags/v${version}.tar.gz firefly-${version}.tar.gz 9df3b69bac287948f1f52d337c63e1cfb8941e78cb9bd3e2fbce6aeaea34f481"
)
assets=(
    "https://raw.githubusercontent.com/tbhaxor/${project_name}/master/examples/main.cpp ${DESTDIR}/home/anon/Documents/firefly_example.cpp 57e14c2b8374a1331779fbbb6de9c76cd3f33ee915edd9f45447b840f87efc71"
)

fetch() {
    # out_dir=$(dirname "$0")
    for file in "${files[@]}"; do
        read -r url filename auth_sum <<<"$file"
        do_download_file "$url" "${PORT_META_DIR}/${filename}"
        if [[ $(sha256sum "${PORT_META_DIR}/${filename}" | awk '{print $1}') != "$auth_sum" ]]; then
            echo "sha256sums($filename) mismatching, re-downloading source files."
            rm -rf "${PORT_META_DIR:?}/${filename:?}"
            do_download_file "$url" "${PORT_META_DIR}/${filename}"
        fi

        run_nocd tar -xf "${PORT_META_DIR}/${filename}"
        ln -sf "${project_name}-${version}" "${port}-${version}"
    done
}

configure() {
    run cmake -Bbuild -GNinja -DCMAKE_INSTALL_PREFIX="$DESTDIR/usr"
}

build() {
    run ninja -C build -j "$MAKEJOBS"
}

install() {
    run ninja -C build -j "$MAKEJOBS" install
}

post_install() {
    for asset in "${assets[@]}"; do
        read -r url filename auth_sum <<<"$asset"
        do_download_file "$url" "$filename"
        if [[ $(sha256sum "${filename}" | awk '{print $1}') != "$auth_sum" ]]; then
            echo "sha256sums($filename) mismatching, removing erroneous file."
            rm -rf "$filename"
        fi
    done

}
