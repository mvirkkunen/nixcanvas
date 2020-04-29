with import <nixpkgs> {};

mkYarnPackage {
  name = "nixcanvas";
  src = ./.;
  pkgConfig.canvas = {
    buildInputs = [ python3 ];
    postInstall = ''
      if [ -f ../.bin/node-pre-gyp ]; then
        patchShebangs ../node-pre-gyp/
        ../.bin/node-pre-gyp install --fallback-to-build
      fi
    '';
  };
}
