pkg_name=opendkim
pkg_origin=core
pkg_version=2.10.3
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="OpenDKIM is an open source implementation of the DKIM (Domain Keys Identified Mail) sender authentication system"
pkg_upstream_url="http://www.opendkim.org"
pkg_license=("BSD-3-Clause")
pkg_source="https://freefr.dl.sourceforge.net/project/opendkim/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="43a0ba57bf942095fe159d0748d8933c6b1dd1117caf0273fa9a0003215e681b"
pkg_deps=(
  core/glibc
)
pkg_build_deps=(
  core/diffutils
  core/gcc
  core/make
  core/pkg-config
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

# do_prepare() {
#   # The configure script expects `file` binaries to be in `/usr/bin`
#   if [[ ! -r /usr/bin/file ]]; then
#     ln -sv "$(pkg_path_for file)/bin/file" /usr/bin/file
#     _clean_file=true
#   fi
# }

do_build() {
  ./configure --prefix="${pkg_prefix}"
}

# do_end() {
#   # Clean up
#   if [[ -n "$_clean_file" ]]; then
#     rm -fv /usr/bin/file
#   fi
# }
