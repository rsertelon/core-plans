pkg_origin=core
pkg_name=glib
pkg_version="2.56.1"
pkg_description="$(cat << EOF
  GLib is a general-purpose utility library, which provides many useful data
  types, macros, type conversions, string utilities, file utilities, a
  mainloop abstraction, and so on. It works on many UNIX-like platforms, as
  well as Windows and OS X.
EOF
)"
pkg_source="https://download.gnome.org/sources/${pkg_name}/${pkg_version%.*}/${pkg_name}-${pkg_version}.tar.xz"
pkg_license=('LGPL-2.0')
pkg_maintainer='The Habitat Maintainers <humans@habitat.sh>'
pkg_upstream_url="https://developer.gnome.org/glib/"
pkg_shasum="40ef3f44f2c651c7a31aedee44259809b6f03d3d20be44545cd7d177221c0b8d"
pkg_deps=(
  core/coreutils
  core/elfutils
  core/glibc
  core/libffi
  core/libiconv
  core/pcre
  core/python
  core/util-linux
  core/zlib
)
pkg_build_deps=(
  core/dbus
  core/diffutils
  core/file
  core/gcc
  core/gettext
  core/libxslt
  core/make
  core/perl
  core/pkg-config
)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)
pkg_interpreters=(core/coreutils)

do_prepare() {
  if [[ ! -r /usr/bin/file ]]; then
    ln -sv "$(pkg_path_for file)/bin/file" /usr/bin/file
    _clean_file=true
  fi
}

do_build() {
  ./configure \
    --prefix="$pkg_prefix" \
    --with-libiconv \
    --disable-gtk-doc \
    --disable-fam
  make
}

do_after() {
  fix_interpreter "$pkg_prefix/bin/*" core/coreutils bin/env
}

do_end() {
  if [[ -n "$_clean_file" ]]; then
    rm -fv /usr/bin/file
  fi
}
