with import <nixpkgs> {};

mkYarnPackage {
  name = "nixcanvas";
  src = ./.;
}
