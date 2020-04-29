with import <nixpkgs> {};

mkYarnPackage {
  name = "nixcanvas";
  src = ./.;
  pkgConfig.canvas = {
    buildInputs = [ cairo freetype libjpeg libpng pango pkg-config pixman python3 ];
    postInstall = ''
      if [[ "$PWD" != /build/yarn_home/.cache/* ]]; then
        node ../.bin/node-pre-gyp install --build-from-source --nodedir=${nodejs}
      fi
    '';
  };
}
