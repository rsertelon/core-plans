pkg_name=glib-networking
pkg_origin=core
pkg_version="2.54.1"
pkg_description="..."
pkg_upstream_url="https://developer.gnome.org/glib-networking/"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('LGPL-2.0')
pkg_source="https://download.gnome.org/sources/${pkg_name}/${pkg_version%.*}/${pkg_name}-${pkg_version}.tar.xz"
pkg_shasum=eaa787b653015a0de31c928e9a17eb57b4ce23c8cf6f277afaec0d685335012f
pkg_deps=(
  core/glib
  core/gnutls
  core/nettle
  core/libtasn1
  core/p11-kit
  core/zlib
)
pkg_build_deps=(
  core/diffutils
  core/gcc
  core/make
  core/pkg-config
  core/gettext
)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)


do_build() {
  ./configure --prefix=$pkg_prefix --without-ca-certificates
}
