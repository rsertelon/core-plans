pkg_name=sozu
pkg_origin=core
pkg_version=5.0
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="X.Org Protocol Headers: fixesproto"
pkg_upstream_url="https://www.x.org/"
pkg_license=('MIT')
pkg_source=""
pkg_shasum=""
pkg_deps=(core/glibc)
pkg_build_deps=(core/cargo-nightly core/rust)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)

do_build() {
    attach
  cargo install sozu --vers 0.3.0 --path $pkg_prefix
}