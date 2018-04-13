pkg_name=glib-networking
pkg_origin=core
pkg_version="2.56.0"
pkg_description="..."
pkg_upstream_url="https://developer.gnome.org/glib-networking/"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('LGPL-2.0')
pkg_source="https://download.gnome.org/sources/${pkg_name}/${pkg_version%.*}/${pkg_name}-${pkg_version}.tar.xz"
pkg_shasum=47fd10bcae2e5039dc5f685e3ea384f48e64a6bee26d755718f534a978477c93
pkg_deps=(
  core/glib
  core/gnutls
  core/nettle
  core/libtasn1
  core/p11-kit
  core/zlib
)
pkg_build_deps=(
  core/gcc
  core/meson
  core/pkg-config
)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)


do_build() {
  attach
}
