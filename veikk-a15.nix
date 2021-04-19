{ stdenv, fetchzip, kernel, kmod }:

stdenv.mkDerivation rec {
  pname = "veikk-a15";
  version = "0";

  src = fetchzip {
    url = "https://github.com/peterwilli/veikk-a15-linux-driver/archive/refs/tags/1.0.zip";
    sha256 = "1x8rg8vp3fcdd8zw1jdrg7jgfha6r9lkpxhk8pha18dd3d75gcif";
  };

  sourceRoot = "source/src";

  KVER = "${kernel.modDirVersion}";
  KBUILD_DIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";

  nativeBuildInputs = kernel.moduleBuildDependencies;
  buildInputs = [ kmod ];

  preBuild = ''
    substituteInPlace Makefile --replace "modules_install" "INSTALL_MOD_PATH=$out modules_install"
    sed -i '/depmod/d' Makefile
    export PATH=${kmod}/sbin:$PATH
    sed -i -e 's:/lib/modules/$(shell uname -r)/build:${KBUILD_DIR}:g' Makefile

    cat ./Makefile
  '';

  installPhase = ''
    make install
  '';

  meta = with stdenv.lib; {
    description = "Veikk A15 driver";
    homepage = https://github.com/peterwilli/veikk-a15-linux-driver;
  };
}