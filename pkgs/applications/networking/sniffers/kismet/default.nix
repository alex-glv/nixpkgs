{ stdenv, fetchurl, pkgconfig, libpcap, ncurses, expat, pcre, libnl }:

stdenv.mkDerivation rec {
  name = "kismet-${version}";
  version = "2016-01-R1";

  src = fetchurl {
    url = "http://www.kismetwireless.net/code/${name}.tar.xz";
    sha256 = "1fbn8znaiibzi7d2jrqgwnhg99w8ga3vxk1687ab4dk8k6b1fbqn";
  };

  buildInputs = [ pkgconfig libpcap ncurses expat pcre libnl ];
  postConfigure = ''
    sed -e 's/-o $(INSTUSR)//' \
        -e 's/-g $(INSTGRP)//' \
        -e 's/-g $(MANGRP)//' \
        -e 's/-g $(SUIDGROUP)//' \
        -i Makefile
  '';

  meta = {
    description = "Wireless network sniffer";
    homepage = http://www.kismetwireless.net/;
    license = "GPL";
  };
}
