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
  core/cacerts
  core/glib
  core/gnutls
  core/nettle
  core/libtasn1
  core/p11-kit
  core/pcre
  core/zlib
)
pkg_build_deps=(
  core/coreutils
  core/gcc
  core/gettext
  core/meson
  core/ninja
  core/pkg-config
)
pkg_lib_dirs=(lib)

export GIO_EXTRA_MODULES_TYPE=aggregate

do_prepare() {
  if [[ ! -r /usr/bin/env ]]; then
    ln -sv "$(pkg_path_for "core/coreutils")/bin/env" /usr/bin/env
    _clean_env=true
  fi
}

do_setup_environment() {
  push_runtime_env GIO_EXTRA_MODULES $pkg_prefix/lib
}

do_build() {
  # install libgiognutls.so in $pkg_prefix/lib
  sed -i 's/gio_module_dir/libdir/g' tls/gnutls/meson.build

  meson build \
      -Dprefix=$pkg_prefix \
      -Dlibproxy_support=false \
      -Dgnome_proxy_support=false \
      -Dca_certificates_path=$(pkg_path_for core/cacerts)/ssl/cert.pem

  cd build/
  ninja
}

do_install() {
  cd build
  ninja install
}

do_end() {
  if [[ -n "$_clean_env" ]]; then
    rm -fv /usr/bin/env
  fi
}
