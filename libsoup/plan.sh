pkg_name=libsoup
pkg_origin=core
pkg_version="2.60.2"
pkg_description="..."
pkg_upstream_url="https://developer.gnome.org/libsoup/"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('LGPL-2.0')
pkg_source="https://download.gnome.org/sources/${pkg_name}/${pkg_version%.*}/${pkg_name}-${pkg_version}.tar.xz"
pkg_shasum=7263cfe18872e2e652c196f5667e514616d9c97c861dfca82a65a55f45f0da01
pkg_deps=(
  core/glib
  core/glib-networking
  core/libxml2
  core/sqlite
)
pkg_build_deps=(
  core/cpanminus
  core/diffutils
  core/expat
  core/file
  core/gettext
  core/gcc
  core/intltool
  core/make
  core/perl
  core/pkg-config
)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)

do_prepare() {
  do_default_prepare

  if [[ ! -r /usr/bin/file ]]; then
    ln -sv "$(pkg_path_for "core/file")/bin/file" /usr/bin/file
    _clean_file=true
  fi

  cpanm XML::Parser --configure-args="EXPATLIBPATH=$(pkg_path_for core/expat)/lib export EXPATINCPATH=$(pkg_path_for core/expat)/include"
}

do_build() {
  attach
  ./configure --prefix=$pkg_prefix
  make
}

do_end() {
  if [[ -n "$_clean_file" ]]; then
    rm -fv /usr/bin/file
  fi
}
