inputs: let
  callLib = file: import file inputs;
in {
  mkPkgs = callLib ./mk-pkgs.nix;
  pkgsConfig = callLib ./pkgs-config.nix;
  sshKeys = callLib ./ssh-keys.nix;
}
