pkg_name=zlib
pkg_derivation=chef
pkg_version=1.2.8
pkg_license=('zlib')
pkg_source=http://downloads.sourceforge.net/project/libpng/$pkg_name/${pkg_version}/${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=36658cb768a54c1d4dec43c3116c27ed893e88b02ecfcb44f2166f9c0b7f2a0d
pkg_gpg_key=3853DA6B
pkg_deps=(chef/glibc)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
