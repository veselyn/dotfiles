{
  config,
  lib,
  pkgs,
  toplevel,
  ...
}: let
  cfg = config.self.modules.generic;
in {
  imports = [
    ./nix.nix
  ];

  options = {
    self.modules.generic = {
      enable = lib.mkEnableOption "generic";
    };
  };

  config = lib.mkIf cfg.enable {
    nix = {
      package = pkgs.nix;
      registry = {
        self.flake = toplevel.self;
        nixpkgs-unstable.flake = toplevel.inputs.nixpkgs;
        nixpkgs-stable.flake = toplevel.inputs.nixpkgs-stable;
        nixpkgs-master.flake = toplevel.inputs.nixpkgs-master;
      };
      settings.experimental-features = ["nix-command" "flakes"];
    };

    nixpkgs = {
      config.allowUnfree = true;
      overlays = builtins.attrValues toplevel.self.overlays;
    };
  };
}
