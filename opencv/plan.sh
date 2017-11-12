pkg_name=opencv
pkg_origin=core
pkg_version=3.3.1
pkg_description=""
pkg_upstream_url="https://opencv.org/"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('BSD-3-Clause')
pkg_source="https://github.com/opencv/opencv/archive/${pkg_version}.tar.gz"
pkg_shasum="5dca3bb0d661af311e25a72b04a7e4c22c47c1aa86eb73e70063cd378a2aa6ee"
pkg_deps=(
  core/ffmpeg
  core/glibc
  core/gtk2
  core/python2
)
pkg_build_deps=(
  core/cmake
  core/gcc
  core/make
  core/pkg-config
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_build() {
  attach
}
