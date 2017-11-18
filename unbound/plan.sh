pkg_name=unbound
pkg_origin=core
pkg_version=1.7.0
pkg_description="Unbound is a validating, recursive, and caching DNS resolver"
pkg_upstream_url="https://unbound.net/"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('BSD-3-Clause')
pkg_source="https://unbound.net/downloads/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="94dd9071fb13d8ccd122a3ac67c4524a3324d0e771fc7a8a7c49af8abfb926a2"
pkg_deps=(
  core/expat
  core/gcc-libs
  core/glibc
  core/openssl
  core/zlib
)
pkg_build_deps=(
  core/bison
  core/diffutils
  core/doxygen
  core/flex
  core/gcc
  core/make
  core/pkg-config
)
pkg_bin_dirs=(sbin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)

do_build() {
  ./configure --prefix="${pkg_prefix}" \
    --with-ssl="$(pkg_path_for "core/openssl")" \
    --with-libexpat="$(pkg_path_for "core/expat")"
  make
}
