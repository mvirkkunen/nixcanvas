with import <nixpkgs> {};

mkYarnPackage {
  name = "nixcanvas";
  src = ./.;
  pkgConfig.canvas = {
    buildInputs = [ cairo freetype libjpeg libpng pango pkg-config pixman python3 ];
    postInstall = ''
      if [ -f ../.bin/node-pre-gyp ]; then
        patchShebangs ../node-pre-gyp/
        ../.bin/node-pre-gyp install --build-from-source --nodedir=${nodejs}
      fi
    '';
  };
}
