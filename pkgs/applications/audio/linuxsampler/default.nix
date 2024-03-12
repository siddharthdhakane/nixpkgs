{ lib, stdenv, fetchurl, autoconf, automake, bison, libtool, pkg-config, which
, alsa-lib, asio, libjack2, libgig, libsndfile, lv2 }:

stdenv.mkDerivation rec {
  pname = "linuxsampler";
  version = "2.3.0";

  src = fetchurl {
    url = "https://download.linuxsampler.org/packages/${pname}-${version}.tar.bz2";
    sha256 = "sha256-Ii+dylTUXmazP8NVjAAMdHs7NK+puml0IrF4fc6DEls=";
  };

  preConfigure = ''
    make -f Makefile.svn
  '';

  nativeBuildInputs = [ autoconf automake bison libtool pkg-config which ];

  buildInputs = [ alsa-lib asio libjack2 libgig libsndfile lv2 ];

  enableParallelBuilding = true;

  meta = with lib; {
    homepage = "http://www.linuxsampler.org";
    description = "Sampler backend";
    longDescription = ''
      Includes sampler engine, audio and MIDI drivers, network layer
      (LSCP) API and native C++ API.

      LinuxSampler is licensed under the GNU GPL with the exception
      that USAGE of the source code, libraries and applications FOR
      COMMERCIAL HARDWARE OR SOFTWARE PRODUCTS IS NOT ALLOWED without
      prior written permission by the LinuxSampler authors. If you
      have questions on the subject, that are not yet covered by the
      FAQ, please contact us.
    '';
    license = licenses.unfree;
    maintainers = [ maintainers.goibhniu ];
    platforms = platforms.linux;
  };
}
