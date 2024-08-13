inputs: let
  callLib = file: import file inputs;
in {
  mkPkgs = callLib ./mk-pkgs.nix;
}
